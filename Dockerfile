# Start with node 9.2 base image
# FROM must be the first command in this file
FROM node:9.2

ENV APP_DIR /usr/src/app

# Run as non-root user inside the docker container
# see https://vimeo.com/171803492 at 17:20 mark
RUN groupadd -r nodejs && useradd -m -r -g nodejs nodejs

# Create an app directory in the Docker container
RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR

# Copy .npm settings and package.json into container
COPY package.json $APP_DIR
COPY .npmrc $APP_DIR

# Copy source into container
COPY src $APP_DIR

# Install dependencies
RUN npm install
# If building code for production:
# RUN npm install --only=production

# If this server uses 1337 by default, expose it from Docker container
#EXPOSE 1337

# now run as new user nodejs from group nodejs
USER nodejs

# Start the container
CMD ["node", "index.js"]
