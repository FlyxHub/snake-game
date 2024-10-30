FROM node:latest
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN cat /app/app/views/game.html
RUN rm -rf ./node_modules && npm install
EXPOSE 3000
CMD ["node", "app.js"]
