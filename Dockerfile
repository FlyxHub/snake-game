FROM node:latest
EXPOSE 3000
COPY . /app
RUN npm install
CMD node /app/app.js
