FROM node:latest
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm install socker.io
COPY . .
EXPOSE 3000
CMD node app.js
