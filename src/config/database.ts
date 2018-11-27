import { ConnectionOptions } from 'typeorm';

// Because of inconsistent behavior of typeorm migration service
// we need to use ts files in dev env and js in other

const basedir = process.cwd();
const isLocal = process.env.NODE_ENV === 'development';
const ext = isLocal ? 'ts' : 'js';
const prefix = isLocal ? '' : 'build/';

export default {
  type: 'postgres',
  host: process.env.TYPEORM_HOST,
  port: parseInt(process.env.TYPEORM_PORT, 10),
  database: process.env.TYPEORM_DATABASE,
  username: process.env.TYPEORM_USERNAME,
  password: process.env.TYPEORM_PASSWORD,
  entities: [`${basedir}/${prefix}src/**/*.entity.${ext}`],
  migrations: [`${basedir}/${prefix}migrations/*.${ext}`],
  cli: {
    migrationsDir: `${basedir}/${prefix}migrations`,
  },
  synchronize: false,
  maxQueryExecutionTime: 1000,
  logging: ['error'],
} as ConnectionOptions;
