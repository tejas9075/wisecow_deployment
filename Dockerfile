# Use an official Ubuntu base image
FROM ubuntu:latest

# Add a maintainer label
LABEL maintainer="tejaspatil9637@gmail.com"

# Install required packages and clean up
RUN apt-get update && apt-get install -y \
    cowsay \
    fortune \
    netcat-traditional \
    && rm -rf /var/lib/apt/lists/*

# Copy the Wisecow application to the container
COPY wisecow.sh /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Set the working directory
WORKDIR /app

# Expose the application's port
EXPOSE 4499

# Run the application
CMD ["./wisecow.sh"]
