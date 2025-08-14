# Use Dart official image as base
FROM dart:stable

# Install Node.js (LTS version)
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Set working directory
WORKDIR /app

# Copy Node.js files
COPY package*.json ./
RUN npm install
COPY index.js orders.js deploy-commands.js ./

# Copy Dart files
COPY pubspec.* bin/ ./bin/
RUN dart pub get

# Expose port if needed
# EXPOSE 3000

# Run both bots concurrently
CMD ["bash", "-c", "node index.js & dart run bin/discord_bot.dart"]
