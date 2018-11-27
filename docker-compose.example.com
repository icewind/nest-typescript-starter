version: '3.4'
# This configuration must never be used in production
# It is meant to be used only for development and as source for your own configuration
services:
  api:
    image: starter:api
    build:
      context: './'
      dockerfile: './Dockerfile'
      target: development
    command: npm run start:debug
    # In case you need to set the order of load
    # depends_on:
    #   postgresql:
    #     condition: service_healthy
    volumes:
      - .:/app
      - /app/node_modules
      - /app/dist
    ports:
      - '3000:3000'
      - '9229:9229'
      - '9230:9230'
    tty: true
    stdin_open: true
    links:
      - 'postgresql:database'
    environment:
      - NODE_PORT=3000
      - NODE_ENV=development

      - TYPEORM_HOST=database
      - TYPEORM_DATABASE=starter
      - TYPEORM_USERNAME=starter_db_user
      - TYPEORM_PASSWORD=starter_db_password
      - TYPEORM_PORT=5432
      - TYPEORM_CONNECTION=postgres
      - TYPEORM_MIGRATIONS_DIR=migrations

      - TYPEORM_MIGRATIONS=/app/migrations/*.ts
      - TYPEORM_ENTITIES_DIR=/app/src/**/*.entity.ts

  postgresql:
    image: postgres:11-alpine
    ports:
      - '5432:5432'
    environment:
      - POSTGRES_DB=starter
      - POSTGRES_USER=starter_db_user
      - POSTGRES_PASSWORD=starter_db_password
      - PGDATA=/var/lib/postgresql/remote-data
    volumes:
      - './postgres-data:/var/lib/postgresql/remote-data'
    healthcheck:
      test: ['CMD-SHELL', 'pg_isready -U starter_db_user -d starter']
      # You can make this value lower if needed.
      interval: 60s
      timeout: 4s
      retries: 3
