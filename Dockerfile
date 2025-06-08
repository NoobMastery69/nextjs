# Base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy only package files first for caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project
COPY . .

# Build project
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Run app in production mode
CMD ["npm", "start"]
