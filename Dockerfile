FROM node:latest
EXPOSE 3000
COPY . /app
CMD node app.js
