FROM node:latest

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json files to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Remove existing node_modules if present
RUN rm -rf ./node_modules && npm install

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["node", "app.js"]
