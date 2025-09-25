# Base image
FROM ubuntu:22.04

# Install required tools and dos2unix
RUN apt-get update && \
    apt-get install -y cowsay fortune-mod netcat dos2unix && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy your Wisecow script into the container
COPY wisecow.sh /app/wisecow.sh

# Convert script line endings to LF and make it executable
RUN dos2unix /app/wisecow.sh && chmod +x /app/wisecow.sh

# Add /usr/games to PATH so cowsay and fortune can be found
ENV PATH="/usr/games:${PATH}"

# Expose the port
EXPOSE 4499

# Run the Wisecow script
CMD ["./wisecow.sh"]
