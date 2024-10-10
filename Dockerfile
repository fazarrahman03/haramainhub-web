# Use the official Node.js image as the base image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

RUN rm -rf .next

# Build the Next.js app
RUN npm run build

# Expose the port that the app runs on
EXPOSE 3000

# Start the Next.js app
CMD ["npm", "start"]
