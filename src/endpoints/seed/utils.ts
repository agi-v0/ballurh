import type { CollectionSlug, GlobalSlug, Payload, PayloadRequest } from 'payload'

/**
 * Clear all data from specified collections
 */
export async function clearCollections({
  payload,
  req,
  collections,
}: {
  payload: Payload
  req: PayloadRequest
  collections: CollectionSlug[]
}): Promise<void> {
  for (const collection of collections) {
    try {
      await payload.db.deleteMany({ collection, req, where: {} })
    } catch (err) {
      payload.logger.error(
        `Error clearing collection ${collection}: ${err instanceof Error ? err.message : String(err)}`,
      )
    }
  }

  const versionedCollections = collections.filter((collection) =>
    Boolean(payload.collections[collection].config.versions),
  )
  for (const collection of versionedCollections) {
    try {
      await payload.db.deleteVersions({ collection, req, where: {} })
    } catch (err) {
      payload.logger.error(
        `Error clearing versions for collection ${collection}: ${err instanceof Error ? err.message : String(err)}`,
      )
    }
  }
}

/**
 * Clear all data from specified globals
 */
export async function clearGlobals({
  payload,
  globals,
}: {
  payload: Payload
  globals: GlobalSlug[]
}): Promise<void> {
  await Promise.all(
    globals.map((slug) =>
      payload
        .updateGlobal({ slug, data: {}, depth: 0, context: { disableRevalidate: true } })
        .catch((err) =>
          payload.logger.error(
            `Error clearing global ${slug}: ${err instanceof Error ? err.message : String(err)}`,
          ),
        ),
    ),
  )
}

/**
 * Create a user with the specified data
 */
export async function createUser({
  payload,
  req,
  data,
}: {
  payload: Payload
  req: PayloadRequest
  data: {
    name: string
    email: string
    password: string
  }
}): Promise<any> {
  try {
    // Clear existing user first if it exists
    await payload
      .delete({
        collection: 'users',
        depth: 0,
        where: {
          email: {
            equals: data.email,
          },
        },
      })
      .catch(() => {
        // Ignore errors if user doesn't exist
      })

    return await payload.create({
      collection: 'users',
      data,
      req,
      depth: 0,
    })
  } catch (error) {
    payload.logger.error(
      `Failed to create user ${data.email}: ${error instanceof Error ? error.message : String(error)}`,
    )
    return null
  }
}
