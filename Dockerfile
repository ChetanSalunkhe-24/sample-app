# Use an official Node.js image with a specific version
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json before installing dependencies (optimizes caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Run Angular unit tests using Karma in headless mode
RUN npm run test -- --no-watch --no-progress --browsers=ChromeHeadless
