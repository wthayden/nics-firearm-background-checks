# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install make and wget
RUN apt-get update && apt-get install -y make wget

# Expose port 8080
EXPOSE 8080

# Define environment variable using the correct format
ENV PORT=8080

# Run make command and then start a simple HTTP server
CMD ["sh", "-c", "make all && python3 -m http.server $PORT"]