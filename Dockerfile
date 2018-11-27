FROM node:10-alpine AS base
WORKDIR /app

# build
FROM base AS development
COPY package*.json /app/
RUN npm install -y
COPY . .
RUN npm run build

# Uncomment this to use test and lint as a building phase.
# This could be done in CI by invoking a container from development stage(like in current compose file)
# FROM development AS test
# COPY --from=development . .
# RUN  npm run lint && npm test

# production stage
FROM base AS production
COPY --from=dependencies /app/package*.json ./
RUN npm install --only=production
COPY --from=development /app/package*.json ./
COPY --from=development /app/dist ./dist

EXPOSE 3000
CMD ["npm", "run", "start:prod"]