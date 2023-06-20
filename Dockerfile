# Build stage
FROM node:16-alpine as build-stage

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .

RUN yarn build

# Production stage
FROM node:16-alpine as production-stage

WORKDIR /app

COPY --from=build-stage /app/dist ./dist
COPY package.json yarn.lock ./

# Install only production dependencies
RUN yarn install --production --frozen-lockfile

# Set the command to start the node server
CMD [ "yarn", "start" ]

# Expose the port the app runs in
EXPOSE 3000
