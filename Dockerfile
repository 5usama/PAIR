FROM node:lts-bookworm

# Install required packages
RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  libwebp-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json .
RUN npm install && npm install -g qrcode-terminal pm2

# Copy app source
COPY . .

# Expose the port (optional)
EXPOSE 5000

# Start the app
CMD ["npm", "start"]
