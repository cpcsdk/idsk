# Use an official lightweight Linux distribution
FROM ubuntu:latest

# Set a non-interactive mode for apt to prevent prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies
RUN apt-get update && apt-get install -y \
    cmake \
    make \
    g++ \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy the source code into the container
COPY . .

# In case compilation was performed on the host
RUN rm -rf build

# Create a build directory and compile the project
RUN mkdir -p build && cd build && \
    cmake .. && \
    cmake --build . 
    
# Install iDSK and cleanup
WORKDIR /root 
RUN cp /app/build/iDSK /usr/local/bin/ && rm -rf /app

# Define the default command (optional)
ENTRYPOINT ["/usr/local/bin/iDSK"]