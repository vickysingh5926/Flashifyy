# Use an official Node.js runtime as a base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Create backend and frontend directories
RUN mkdir backend frontend

# Copy package.json and package-lock.json of the backend to the backend directory
COPY backend/package*.json backend/

# Copy package.json and package-lock.json of the frontend to the frontend directory
COPY frontend/package*.json frontend/

# Install the backend dependencies
RUN cd backend && npm install

# Install the frontend dependencies
RUN cd frontend && npm install

# Install PM2 globally
RUN npm install -g pm2

# Copy the backend code to the backend directory
COPY backend/ backend/

# Copy the frontend code to the frontend directory
COPY frontend/ frontend/

# Copy the start script
COPY start.sh .

# Make the start script executable
RUN chmod +x start.sh

# Expose the backend and frontend ports
EXPOSE 5000 3000

# Start both backend and frontend using the start script
CMD ["./start.sh"]
