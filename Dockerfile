FROM node:lts-bookworm

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY package.json .

RUN npm install && npm cache clean --force
RUN npm install -g qrcode-terminal pm2 && npm cache clean --force

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
