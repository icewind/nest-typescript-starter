import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import AppController from './app.controller';
import AppService from './app.service';
import { dbConnectionOptions } from '../../config';

@Module({
  imports: [TypeOrmModule.forRoot(dbConnectionOptions)],
  controllers: [AppController],
  providers: [AppService],
})
export default class AppModule {}
