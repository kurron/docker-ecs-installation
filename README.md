#Overview
This project is a simple Docker image that installs Amazon ECS descriptors and installs them to an
existing ECS cluster.  The idea is to make this a step in a CI pipeline. 

#Prerequisites
* a working [Docker](http://docker.io) engine
* a working [Docker Compose](http://docker.io) installation
* existing ECS descriptors published via the [Docker ECS Publication](https://github.com/kurron/docker-ecs-publication) container

#Building
Type `docker-compose build` to build the image.

#Installation
Docker will automatically install the newly built image into the cache.

#Tips and Tricks

##Testing The Image

`docker-compose up` will launch the image allowing you to test your configuration and descriptors. The `docker-compose.yml` file controls
how the container obtains the descriptors and needs to be modified to match your environment. The default values will not work for you. 

##Required Environment Variables
The following must be specified in the container's environment in order for it to operate correctly.

* **AWS_ACCESS_KEY_ID** - the Amazon access ID to use when uploading the decriptors 
* **AWS_SECRET_ACCESS_KEY** - the Amazon access key to use when uploading the descriptors 
* **AWS_REGION** - the Amazon region the ECS cluster resides. eg. us-west-2
* **BRANCH** - the VCS branch the descriptors live in.  Used to construct the version. Only the values of ` master` and `development` are respected.
* **MAJOR** - the major version number, see [Semantic Versioning](http://semver.org/). Used to construct the version. 
* **MINOR** - the minor version number, see [Semantic Versioning](http://semver.org/). Used to construct the version.
* **PATCH** - the patch version number, see [Semantic Versioning](http://semver.org/). Used to construct the version.
* **GROUP** - the group portion of the Maven coordinates to use when fetching the descriptors, eg. org.kurron com.transparent.experiment
* **RELEASE_URL** - the URL where `master` branch descriptors live, eg. `http://artifactory.example.com/artifactory/release` 
* **MILESTONE_URL** - the URL where `development` branch live, eg. `http://artifactory.example.com/artifactory/milestone`
* **ARTIFACT_ID** - the name portion of the Maven coordinates of the descriptors, eg. example-container 

#Troubleshooting

TODO

#License and Credits
This project is licensed under the [Apache License Version 2.0, January 2004](http://www.apache.org/licenses/).

#List of Changes

