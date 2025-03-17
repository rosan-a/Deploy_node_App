# Use a minimal Node.js 18 Alpine image
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json before copying the rest of the files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application source code
COPY . .

# Expose the application port
EXPOSE 3000

# Set runtime environment variables (should be passed at runtime, not hardcoded)
ENV DOMAIN="http://localhost:3000" \
    PORT=3000 \
    STATIC_DIR="./client"

# Use CMD to run the application
CMD ["node", "server.js"]
