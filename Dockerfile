# Use the base image for Node.js (adapt it based on your stack)
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port on which your app will run
EXPOSE 80

# Define the command to start the app
CMD ["npm", "start"]

