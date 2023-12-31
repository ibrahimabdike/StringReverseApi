# Base image
FROM python:3.8.10

# setup environment variable  
ENV DockerHOME=/home/app/webapp

# set work directory  
RUN mkdir -p $DockerHOME 

# where code lives  
WORKDIR $DockerHOME 


#set env variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies  
RUN pip install --upgrade pip

# copy whole project to your docker home directory. 
COPY . $DockerHOME 

# run this command to install all dependencies  
RUN pip install -r requirements.txt
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
# port where the Django app runs  
EXPOSE 8000  
# start server  
CMD python3 manage.py runserver 