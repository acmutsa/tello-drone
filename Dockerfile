# set base image (host OS)
FROM python:3.8
MAINTAINER "Zachary Seligman"

# args picked from command line
ARG user
ARG uid
ARG gid

# add new user with the above credentials
ENV USERNAME ${user}
RUN useradd -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod  --uid ${uid} $USERNAME && \
        groupmod --gid ${gid} $USERNAME
RUN adduser ${user} video
RUN usermod -a -G video ${user}

# working directory in the container
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
USER ${user}

ENV DISPLAY $DISPLAY

# copy the content of local src directory to the working directory
COPY app/src/ .

# command to run on container start
CMD ["python", "./main.py"]
