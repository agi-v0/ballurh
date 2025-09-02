#!/bin/bash

# Load environment variables
ENV_FILE=".env.production"

if [ ! -f "$ENV_FILE" ]; then
  echo "❌ Env file '$ENV_FILE' not found."
  exit 1
fi

export $(grep -v '^#' "$ENV_FILE" | xargs)

# ========== CONFIGURATION ==========
# Remote DB connection
# REMOTE_HOST=""
# REMOTE_PORT=""
# REMOTE_DB=""
# REMOTE_USER=""
# REMOTE_PASSWORD=""

# Local Docker Postgres container
LOCAL_CONTAINER="postgres17.5"
LOCAL_DB="ballurh"
LOCAL_USER="postgres"

# Postgres version to match remote DB
POSTGRES_VERSION="15"

# Docker network shared by containers (default is 'bridge')
DOCKER_NETWORK="bridge"

# Dump file details
DUMP_FILE="dump.sql"
LOCAL_DUMP_PATH="./$DUMP_FILE"
CONTAINER_DUMP_PATH="/tmp/$DUMP_FILE"

# ===================================

echo "▶ Setting up ssh tunnel..."

ssh -fN -L 127.0.0.1:5433:ballurh-website-db-prod.cvljtwx9nyu3.me-south-1.rds.amazonaws.com:5432 ballurh

echo "▶ Dumping remote database using Dockerized pg_dump..."

docker run --rm \
  -e PGPASSWORD=temppassword \
  --network="$DOCKER_NETWORK" \
  -v "$PWD":/dump \
  postgres:$POSTGRES_VERSION \
  bash -c "pg_dump '$DATABASE_URI' \
    --clean \
    --if-exists \
    --quote-all-identifiers \
    --no-owner \
    --no-privileges \
    -f /dump/$DUMP_FILE"

if [ $? -ne 0 ]; then
  echo "❌ Failed to dump remote database."
  exit 1
fi

echo "✅ Remote dump saved at $LOCAL_DUMP_PATH"



echo "▶ Copying dump into container '$LOCAL_CONTAINER'..."
docker cp "$LOCAL_DUMP_PATH" "$LOCAL_CONTAINER:$CONTAINER_DUMP_PATH"

echo "▶ Restoring into local DB..."
docker exec -u postgres "$LOCAL_CONTAINER" bash -c \
  "psql -U $LOCAL_USER -d $LOCAL_DB -f $CONTAINER_DUMP_PATH"

if [ $? -eq 0 ]; then
  echo "✅ Restore completed successfully."
else
  echo "❌ Restore failed."
  exit 1
fi

# Optional: Uncomment to clean up local dump
# rm "$LOCAL_DUMP_PATH"

echo "▶ Syncing s3 bucket..."

aws s3 sync s3://$AWS_BUCKET ./public

if [ $? -eq 0 ]; then
  echo "✅ S3 bucket synced successfully."
else
  echo "❌ S3 bucket sync failed."
  exit 1
fi

echo "▶ Killing ssh tunnel..."
kill $(pgrep -f "ssh -fN -L 127.0.0.1:5433:ballurh-website-db-prod.cvljtwx9nyu3.me-south-1.rds.amazonaws.com:5432 ballurh")