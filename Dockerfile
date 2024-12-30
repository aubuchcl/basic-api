# Use the official Node.js LTS image as a base image
FROM node:lts

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Expose port 80
EXPOSE 80

# Start the application
CMD ["node", "index.js"]
