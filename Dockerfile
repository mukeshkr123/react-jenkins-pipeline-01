# Use an official Node.js runtime as a parent image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the project files to the working directory
COPY . .

# Build the React application for production
RUN npm run build

# Install a lightweight web server to serve the static files
RUN npm install -g serve

# Expose the port the app runs on
EXPOSE 5000

# Command to run the app using serve
CMD ["serve", "-s", "dist", "-l", "5000"]
