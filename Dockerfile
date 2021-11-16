# set base image (host OS)
FROM python:3.8
MAINTAINER "Zachary Seligman"

WORKDIR /tello-drone

COPY app/requirements.txt .

# install dependencies
USER root
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN pip3 install -r requirements.txt
RUN apt-get --assume-yes install software-properties-common
RUN apt-get --assume-yes install v4l-utils
RUN apt-get -y install xauth
RUN apt-get install -qqy x11-apps
USER ${user}

ENV DISPLAY $DISPLAY

# copy the content of local src directory to the working directory
COPY app/src/ .

# command to run on container start
CMD ["python", "./main.py"]
