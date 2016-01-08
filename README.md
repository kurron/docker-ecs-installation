#Overview
This project is a simple Docker image that installs Amazon ECS descriptors and installs them to an
existing ECS cluster.  The idea is to make this a step in a CI pipeline. 

#Prerequisites
* a working [Docker](http://docker.io) engine
* a working [Docker Compose](http://docker.io) installation

#Building
Type `docker-compose build` to build the image.

#Installation
Docker will automatically install the newly built image into the cache.

#Tips and Tricks

##Testing The Image

`docker-compose up` will launch the image allowing you to test your configuration and descriptors. The `docker-compose.yml` file controls
how the container obtains the descriptors and needs to be modified to match your environment. The default values will not work for you. 

#Troubleshooting

TODO

#License and Credits
This project is licensed under the [Apache License Version 2.0, January 2004](http://www.apache.org/licenses/).

#List of Changes

