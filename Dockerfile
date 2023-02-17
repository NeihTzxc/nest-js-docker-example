# Use a lightweight Node.js runtime
FROM node:16.13.1-alpine3.14

# Set the working directory to /app
WORKDIR /app

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Copy the current directory contents into the container at /app
COPY . .

# Expose the port that the app is running on
EXPOSE 3000

# Start the app
ENTRYPOINT ["yarn"]