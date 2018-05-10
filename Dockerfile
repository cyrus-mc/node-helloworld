FROM node:8.11.1-slim AS build

# copy in package*.json only so we can cache dependencies
COPY package*.json src/

WORKDIR ./src

# install npm modules
RUN npm install --verbose

# copy in the rest of the source
COPY . .

# build/transpile
RUN npm run transpile

FROM build AS test

# build arg used to invalidate cache so tests will run
ARG TIMESTAMP=

# run our unit tests
RUN npm run test

# prune npm modules
FROM build AS prune

# prune npm modules
RUN npm prune --production --verbose

FROM node:8.11.1-slim

# define port to expose
ENV PORT=3000
EXPOSE $PORT

# set our work directory
ENV DIR=/app
WORKDIR $DIR

# copy files from previous stages
COPY --from=prune /src/node_modules node_modules
COPY --from=build /src/build .

HEALTHCHECK --interval=5s \
            --timeout=5s \
            --retries=6 \
            CMD curl -fs http://localhost:$PORT || exit 1

ENTRYPOINT [ "npm" ]
CMD [ "run", "start" ]
