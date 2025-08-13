# Use Node.js official image
FROM node:20

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first for efficient caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files
COPY . .

# Expose port if needed (optional)
# EXPOSE 3000

# Start the bot
# Render will inject the TOKEN environment variable at runtime
CMD ["node", "index.js"]
