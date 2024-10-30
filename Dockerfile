FROM node:latest
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN rm -rf ./node_modules && npm install
EXPOSE 3000
COPY . .
CMD ["node", "app.js"]
