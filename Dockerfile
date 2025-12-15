
# Use a small, secure Node base image
FROM node:20-alpine

# Create and use app directory
WORKDIR /usr/src/app

# Install only production deps first for better caching
COPY package*.json ./
RUN npm ci --only=production

# Copy the rest of your source
COPY . .

# Set environment
ENV NODE_ENV=production

# Expose the port your app listens on
EXPOSE 3000

# Healthcheck: checks root endpoint
HEALTHCHECK --interval=30s --timeout=5s --start-period=15s --retries=3 \
  CMD wget -  CMD wget -qO- http://localhost:3000/ || exit 1

# Run the app
