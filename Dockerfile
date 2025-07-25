FROM node:lts-buster

# Install necessary packages
RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  libwebp-dev && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/src/app

# Copy package info and install dependencies
COPY package.json .

RUN npm install && npm install -g qrcode-terminal pm2

# Copy rest of the project files
COPY . .

# Expose port if needed
EXPOSE 5000

# Start the app
CMD ["npm", "start"]
