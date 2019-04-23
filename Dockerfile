#
# STAGE 1: Build.
#

# Base image.
FROM arm32v6/node:alpine as builder

RUN mkdir -p /usr/docker-rpi
WORKDIR /usr/docker-rpi

# Installing dependencies.
COPY package*.json /usr/docker-rpi/
RUN npm install

# Copy source into image.
COPY . /usr/src/docker-rpi/

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

# Copying openhome-panel source into web server root.
COPY --from=builder /usr/src/openhome-panel/docker-rpi /usr/share/nginx/html

# Exposing ports.
EXPOSE 80

# Starting server.
CMD ["nginx", "-g", "daemon off;"]
