# Create the production stage image 

# Step 1: Building the image of the application
# Give the step a name to refere to it in next steps
FROM node:alpine AS builder 

# Set the working directory
WORKDIR /app

# Copy the dependencies
COPY package.json .

# Install the application
RUN npm install

# Copy the project files to the container
COPY . .

# Build the applicaiton
RUN npm run build

#Step 2: Building the web server image
# and deploy the application from the pervious 
# step into the web server image.
FROM nginx

# Deploy the application from pervious step into the web server
COPY --from=builder /app/build /usr/share/nginx/html


