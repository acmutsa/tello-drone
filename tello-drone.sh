#!/usr/bin/env 

docker build . -t myimage:latest
echo "---------- BUILD FINISHED ----------"

docker run --privileged -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
	--hostname=$HOSTNAME -v $HOME/.Xauthority:/root/.Xauthority \
	-it myimage:latest
echo "----------XAUTH AND RUNNING FINISHED----------"

