# Base image with Dart
FROM dart:stable

# Install Node.js 20
RUN apt-get update && apt-get install -y curl \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean

# Set working directory
WORKDIR /app

# Copy Node.js dependency files
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy Dart dependency file
COPY pubspec.* ./

# Get Dart dependencies
RUN dart pub get || true  # Ignore if no Dart project

# Copy the rest of your files
COPY . .

# Expose HTTP port for keep_alive.js
EXPOSE 8080

# Start both bots
# "node index.js" starts Node bot
# "dart run" starts Dart bot
CMD sh -c "node index.js & dart run"
