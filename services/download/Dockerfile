FROM bash:alpine3.20

# Install necessary packages
RUN apk update && apk add --no-cache git parallel aria2

# Copy the script and other necessary files
COPY . /docker

# Make the script executable
RUN chmod +x /docker/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/docker/entrypoint.sh"]
