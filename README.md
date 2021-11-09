# tello-drone

From UTSA students within the Rowdy Creators organization (under ACM), computer vision software for a Tello drone will 
be developed for delivering items autonomously. If you'd like to contribute, please go to https://acmutsa.org/ to get 
in contact with ACM UTSA.

No prior knowledge is required for participating in this project. Below is a list of all resources you will need to
enable your contribution:
* Setting up Docker: https://docs.docker.com/get-started/
* Setting up Github: https://docs.github.com/en/get-started/quickstart/set-up-git
* OpenCV-Python: https://docs.opencv.org/4.x/d6/d00/tutorial_py_root.html
* Tello SDK 2.0 User Guide: https://dl-cdn.ryzerobotics.com/downloads/Tello/Tello%20SDK%202.0%20User%20Guide.pdf
* Tello Programming with Python: https://tello.oneoffcoder.com/python-manual-control.html

### Repository Structure
* app: contains source code and Python package requirements for Docker.
* docs: Any documentation associated with code, installation, or any other process within this repository.

### Installation and Running
This project is managed with Docker. But, if you'd like to run this project locally, please see app/requirements.txt
for Python packages needed for this project.

After cloning this repository, with tello-drone/ as your working directory, use the following commands in your terminal
to build and run the docker image:
#### `bash tello-drone.sh`
