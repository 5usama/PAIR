FROM node:20-bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ffmpeg \
        imagemagick \
        libwebp-dev \
        ca-certificates \
        curl \
        gnupg \
        git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY package.json .

RUN npm install --legacy-peer-deps && npm install -g pm2 qrcode-terminal

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
