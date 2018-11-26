FROM node:10-alpine AS base
WORKDIR /app

# deps
FROM base AS dependencies
COPY package*.json /app/
RUN npm install -y

# build
FROM dependencies AS build
COPY . .
RUN npm run build

# run
FROM base
COPY --from=dependencies /app/package*.json ./
RUN npm install --only=production
COPY --from=build /app ./

EXPOSE 3000
CMD ["npm", "run", "start:prod"]