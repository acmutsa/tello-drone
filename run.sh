#!/usr/bin/env bash

docker build --build-arg user=$USER --build-arg uid=$(id -u) --build-arg gid=$(id -g) -t myimage:latest -f Dockerfile .
echo "---------- BUILD FINISHED ----------"

xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f /tmp/.docker.xauth nmerge -

echo "---------- XAUTH FINISHED ----------"

#docker run --privileged -ti -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /tmp/.docker.xauth:/tmp/.docker.xauth:rw -e XAUTHORITY=/tmp/.docker.xauth .
docker run --privileged -ti -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /tmp/.docker.xauth:/tmp/.docker.xauth:rw -e XAUTHORITY=/tmp/.docker.xauth myimage:latest


echo "---------- RUNNING FINISHED----------"

