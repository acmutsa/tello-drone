# tello-drone
From UTSA students within the Rowdy Creators organization (under ACM), computer vision software for a Tello drone will 
be developed for delivering items autonomously. If you'd like to contribute, please go to https://acmutsa.org/ to get 
in contact with ACM UTSA.

### Repository Structure
* app: contains source code and Python package requirements for Docker.
* src: Any code associated with this repository.
* docs: Any documentation associated with code, installation, or any other process within this repository.
* images: Images related to training, testing, masks, etc.

### Running tello-drone and Installing Dependencies
This project is managed with Docker. If you'd like to run this project locally, please see app/requirements.txt
for Python packages needed for this project.

After cloning this repository, with tello-drone/ as your working directory, use the following commands in your terminal
to build and run the docker image:
#### `docker build -t <image_name> .`
#### `docker run <image_name>`
