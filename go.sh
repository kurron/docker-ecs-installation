#!/bin/bash

export ORG_GRADLE_PROJECT_family=Alpha
export ORG_GRADLE_PROJECT_containerName=Bravo
export ORG_GRADLE_PROJECT_registry=Charlie
export ORG_GRADLE_PROJECT_imageName=Delta
export ORG_GRADLE_PROJECT_clusterName=Foxtrot
export ORG_GRADLE_PROJECT_serviceName=Golf
export ORG_GRADLE_PROJECT_loadBalancerName=Hotel
export ORG_GRADLE_PROJECT_clientToken=India
export ORG_GRADLE_PROJECT_ecsInstanceRole=Juliett
export ORG_GRADLE_PROJECT_desiredCount=Kilo

rm -rf build 
gradle
cat build/definitions/*
