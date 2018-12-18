<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo_text.svg" width="320" alt="Nest Logo" /></a>
</p>

## Description

Simple and clean starter project for [Nest](https://github.com/nestjs/nest) framework.

## Usage

Get the source code by using this command

```bash
git clone git@github.com:icewind/nest-typescript-starter.git <project_name> && cd <project_name>
```

Then detach it from the original repository. Since this project does not use submodules, it is safe to remove a .git folder and initialize a new repository. **WARNING** This snippet performs force push, so you have to make sure there is no any important information in the remote origin. Otherwise, you have to merge it carefully.

```bash
rm -rf .git
git init
git add .
git commit -m "Initial commit"
git remote add origin <remote-repository-uri>
git push -u --force origin master
```

To provide your app an environment, you may copy `.env.example` to `.env` and add all required variables. If you use Docker for development you may do the same with `docker-compose.example.yml`. **IMPORTANT** In case you use docker you have to run all commands inside the container by using `docker run/exec <container> <command>`

## Installation

I'm trying to keep all dependencies up to date the most of them are specified with `latest` version. To fix particular versions you need to run `npm install` command. It will make you a file `package-lock.json` with exact versions available at the moment. Add this file to your version control system.

## Running the app

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
npm run start:prod
```

For docker there is only one option available and it is

```bash
docker-compose up
```

You may add '-d' flag in case you want to detach a process from the current terminal.

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

## Additional commands

There are a list of additional commands to help you make some actions faster.

#### Create a new migration file

```bash
npm run migrations:create -- -n "MigrationName"
```

#### Once you created an entity, you can generate SQL query for the migration by using

```bash
npm run db:schema:log
```

#### Run migrations

```bash
npm run migrations:run
```

#### Revert migrations

```bash
npm run migrations:revert
```

#### Generate entities from database schema

```bash
npm run migrations:generate
```

TypeORM generates migrations as typescript files. And in a production environment there is no need to use TS. So you may use

```bash
npm run migrations:run:production
npm run migrations:revert:production
```

to use transpiled js files instead.
