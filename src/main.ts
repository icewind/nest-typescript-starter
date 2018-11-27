import { config } from 'dotenv';
config(); // Configuration should be done as early as possible

import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './modules/app';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // Add global validation pipe to automatically check all incoming data
  app.useGlobalPipes(
    new ValidationPipe({ skipMissingProperties: true, whitelist: true }),
  );

  await app.listen(3000);
}
bootstrap();
