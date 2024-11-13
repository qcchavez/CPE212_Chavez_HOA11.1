# Use a smaller base image for efficiency
FROM ubuntu:20.04

# Set environment variable to prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache, MySQL, and PHP in one RUN statement to minimize layers
RUN apt-get update && apt-get install -y \
    apache2 \
    mysql-server \
    php \
    libapache2-mod-php \
    php-mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*  # Clean up apt cache to reduce image size

# Set MySQL environment variables
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=exampledb

# Copy the custom index.html to Apache's default directory
COPY ./index.html /var/www/html/

# Expose Apache and MySQL ports
EXPOSE 80 3306

# Start MySQL and Apache in the background and foreground respectively, keeping the container running
CMD service mysql start && apache2ctl -D FOREGROUND

