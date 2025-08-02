import * as migration_20250726_214623 from './20250726_214623';
import * as migration_20250726_214702 from './20250726_214702';
import * as migration_20250727_002055 from './20250727_002055';
import * as migration_20250727_002240 from './20250727_002240';
import * as migration_20250727_110508 from './20250727_110508';
import * as migration_20250727_131006 from './20250727_131006';
import * as migration_20250727_135302 from './20250727_135302';
import * as migration_20250727_222224 from './20250727_222224';
import * as migration_20250728_025050 from './20250728_025050';
import * as migration_20250728_034603 from './20250728_034603';
import * as migration_20250802_220035 from './20250802_220035';

export const migrations = [
  {
    up: migration_20250726_214623.up,
    down: migration_20250726_214623.down,
    name: '20250726_214623',
  },
  {
    up: migration_20250726_214702.up,
    down: migration_20250726_214702.down,
    name: '20250726_214702',
  },
  {
    up: migration_20250727_002055.up,
    down: migration_20250727_002055.down,
    name: '20250727_002055',
  },
  {
    up: migration_20250727_002240.up,
    down: migration_20250727_002240.down,
    name: '20250727_002240',
  },
  {
    up: migration_20250727_110508.up,
    down: migration_20250727_110508.down,
    name: '20250727_110508',
  },
  {
    up: migration_20250727_131006.up,
    down: migration_20250727_131006.down,
    name: '20250727_131006',
  },
  {
    up: migration_20250727_135302.up,
    down: migration_20250727_135302.down,
    name: '20250727_135302',
  },
  {
    up: migration_20250727_222224.up,
    down: migration_20250727_222224.down,
    name: '20250727_222224',
  },
  {
    up: migration_20250728_025050.up,
    down: migration_20250728_025050.down,
    name: '20250728_025050',
  },
  {
    up: migration_20250728_034603.up,
    down: migration_20250728_034603.down,
    name: '20250728_034603',
  },
  {
    up: migration_20250802_220035.up,
    down: migration_20250802_220035.down,
    name: '20250802_220035'
  },
];
