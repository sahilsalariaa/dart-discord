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

# Set environment variable for the token (Render will provide this)
ENV TOKEN=${TOKEN}

# Expose the port if your bot uses one (optional)
# EXPOSE 3000

# Start the bot
CMD ["node", "index.js"]
