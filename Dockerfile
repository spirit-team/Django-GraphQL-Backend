# Pull base image
FROM python:3.7

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

# Install dependencies
#RUN pip install --upgrade pip
#RUN pip install pipenv
RUN apt-get update && \
    apt-get -y install gcc unixodbc unixodbc-dev python-pyodbc
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt 

# Copy project
COPY . /code/

#Expose
EXPOSE 8000
