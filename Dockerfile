# Pull base image from docker hub
FROM python:3.9

# Declare a variable for working directory
ARG DockerWorkingDir=/home/prac

# Create or select the woring directory
WORKDIR $DockerWorkingDir

# Set python unbuffered 1
ENV PYTHONUNBUFFERED=1

# Copy the requirements.txt file into the docker working directory
COPY ./requirements.txt $DockerWorkingDir

# install the requirements
RUN pip install -r requirements.txt

# Copy everthing into the docker directory
COPY . $DockerWorkingDir

# Expose the port
EXPOSE 8000

# Run the django command after image has been built and container is running
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
