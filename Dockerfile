# Use Node.js official image
FROM node:20

# Set working directory
WORKDIR /app

# Copy package.json first for caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the files
COPY . .

# Start the bot
CMD ["node", "index.js"]
