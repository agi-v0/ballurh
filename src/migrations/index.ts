import * as migration_20250726_214623 from './20250726_214623';
import * as migration_20250726_214702 from './20250726_214702';

export const migrations = [
  {
    up: migration_20250726_214623.up,
    down: migration_20250726_214623.down,
    name: '20250726_214623',
  },
  {
    up: migration_20250726_214702.up,
    down: migration_20250726_214702.down,
    name: '20250726_214702'
  },
];
