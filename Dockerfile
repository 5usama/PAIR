# Use Node base image
FROM node:20

# Set working directory
WORKDIR /app

# Copy only necessary files for install
COPY package.json

# Install node modules locally (outside Docker) first
# Here, skip prepare scripts inside Docker by using `--ignore-scripts`
RUN npm install --ignore-scripts && npm cache clean --force

# Now copy rest of your code
COPY . .

# Optional: manually run prepare after copying source if needed
# RUN npm run prepare

# Expose port if needed (optional)
EXPOSE 3000

# Run app
CMD ["npm", "start"]
