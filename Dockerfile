#
# STAGE 1: Build.
#

# Base image.
FROM balenalib/raspberry-pi-alpine-node:10.15-latest

RUN apk add --update \
    linux-headers \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

RUN mkdir -p /usr/docker-rpi
WORKDIR /usr/docker-rpi

# Installing dependencies.
COPY package*.json /usr/docker-rpi/
RUN npm install

# Copy source into image.
COPY . /usr/docker-rpi/

# Building app.
RUN npm run-script build

#
# STAGE 2: Setup.
#

FROM arm32v6/nginx:alpine

# Removing nginx default page.
RUN rm -rf /usr/share/nginx/html/*

# Copying nginx configuration.
COPY /nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Copying source into web server root.
COPY --from=0 /usr/docker-rpi/dist /usr/share/nginx/html

# Exposing ports.
EXPOSE 80

# Starting server.
CMD ["nginx", "-g", "daemon off;"]
