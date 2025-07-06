# Use a slim Python 3 base
FROM python:3.11-slim

# Where our app lives in the container
WORKDIR /app

# Copy everything (your fork) into the container
COPY . /app

# Install Python deps
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port SearxNG listens on
EXPOSE 8080

# Launch SearxNG via Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:8080", "searx.webapp:app"]
