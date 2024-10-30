FROM node:latest
WORKDIR /
COPY package*.json ./
RUN npm install
COPY . .
RUN rm -rf ./node_modules && npm install
EXPOSE 3000
CMD ["node", "app.js"]
