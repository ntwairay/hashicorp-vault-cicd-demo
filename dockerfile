FROM node:latest

# App
ADD . /web
WORKDIR /web

# Environment variable
ARG API_SECRET

# Install app dependencies
RUN npm install

EXPOSE  8080
ENTRYPOINT ["nodejs", "./index.js"]
