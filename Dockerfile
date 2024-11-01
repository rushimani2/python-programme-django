# Use Ubuntu as the base image
FROM ubuntu

# Set working directory
WORKDIR /app

# Copy necessary files
COPY requirements.txt /app
COPY devops /app

# Update apt and install required dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip install --break-system-packages -r requirements.txt

# Set entrypoint and command
ENTRYPOINT ["python3"]
CMD ["manage.py", "runserver", "0.0.0.0:8000"]

