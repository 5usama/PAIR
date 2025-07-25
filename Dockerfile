FROM node:lts-buster

# Prevent tzdata and other packages from asking interactive questions
ENV DEBIAN_FRONTEND=noninteractive

# Install required Linux packages
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install node modules
COPY package.json .

RUN npm install && npm install -g qrcode-terminal pm2

# Copy rest of the code
COPY . .

# Expose port
EXPOSE 5000

# Start the app
CMD ["npm", "start"]
