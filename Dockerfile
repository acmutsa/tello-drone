# set base image (host OS)
FROM python:3.8

# working directory in the container
WORKDIR /tello-drone

COPY app/requirements.txt .

# install dependencies
RUN pip3 install -r requirements.txt

# copy the content of local src directory to the working directory
COPY app/src/ .

# command to run on container start
CMD ["python", "./main.py"]