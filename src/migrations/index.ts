import * as migration_20250726_090210 from './20250726_090210';

export const migrations = [
  {
    up: migration_20250726_090210.up,
    down: migration_20250726_090210.down,
    name: '20250726_090210'
  },
];
