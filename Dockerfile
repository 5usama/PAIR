# 1. Use Node.js base image
FROM node:18

# 2. Create and set working directory
WORKDIR /app

# 3. Copy package.json and install dependencies
COPY package*.json ./

# 4. Install only necessary packages (no -g install needed for pm2)
RUN npm install

# 5. Copy the rest of your bot's source code
COPY . .

# 6. Expose port if needed (only if using express, optional)
# EXPOSE 3000

# 7. Start the app using npm start (defined in package.json)
CMD ["npm", "start"]
