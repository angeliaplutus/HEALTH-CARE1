# DockerfileCopy code# Base image
# FROM python:3.12-slim-buster
FROM python:3.9-slim

# Working directory
WORKDIR .

# Copy requirements file and install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files
COPY . .


# Set the env flask
# ENV FLASK_APP=app.py




# Expose the server port
EXPOSE 8090

# Command to start the server

# CMD ["flask", "run", "--host = 0.0.0.0"]
CMD ["gunicorn", "-b", "0.0.0.0:8090", "app:app"]