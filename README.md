# Docker image for website screenshot

## Getting Started....
This project is for building a docker image which can be used to create screenshots of webpages. 

## LOAD the docker image
You can load the image into docker using the command:
docker load -i < path to image tar file >

## Setup on Docker
### Build image:
docker build -t testscreenshot .

### RUN container
Run container, will save the screenshot as  output.png:
docker run -it testscreenshot -v ${PWD}:/  http://www.google.com
If you don't pass any arguments, it will take default argument as http://www.google.com
-v command will mount directory  of host system to docker container directory 

## HOW IT WORKS
It mainly consists of three files. a nodejs (index.js) file, bash file, and Dockerfile.
Dockerfile uses the entry point as shellscript.

Shellscript consists of many commands to install dependencies for nodejs and google-chrome.
Moreover it launches google-chrome as background process and run index.js script.

Index.js file evaluate the argument passed and save the output as output.png
