#!/bin/bash

#CMD="/usr/local/bin/aws ecs register-task-definition --region $AWS_REGION --cli-input-json file://$PWD/task-definitions/asgard-hid-generator.json"

# if branch is master then
#    use release URL
# else
#    use milestone URL
# endif
# transform artifact group into path com.transparent.al becomes com/transparent/al
# need artifact id, eg. hid-generator
# transform branch, major, minor, patch into a version, eg. 1.0.10.RELEASE
# combine those pieces into a final URL

BRANCH=development
MAJOR=1
MINOR=0
PATCH=6
GROUP=com.transparent.al
GROUP_PATH=$(echo ${GROUP} | tr . /)
RELEASE_URL=http://192.168.254.81:81/artifactory/transparent-release
MILESTONE_URL=http://192.168.254.81:81/artifactory/transparent-milestone
ARTIFACT_ID=hid-generator

if [ "${BRANCH}" = "master" ]; then
    VERSION="${MAJOR}.${MINOR}.${PATCH}.RELEASE"
    URL=${RELEASE_URL} 
else
    VERSION="${MAJOR}.${MINOR}.${PATCH}.MILESTONE"
    URL=${MILESTONE_URL} 
fi

TASK_CMD="curl --get --silent --show-error --output /tmp/task-definition.json ${URL}/${GROUP_PATH}/${ARTIFACT_ID}/${VERSION}/${ARTIFACT_ID}-${VERSION}-task-definition.json"
echo ${TASK_CMD}
eval ${TASK_CMD}

SERVICE_CMD="curl --get --silent --show-error --output /tmp/service-definition.json ${URL}/${GROUP_PATH}/${ARTIFACT_ID}/${VERSION}/${ARTIFACT_ID}-${VERSION}-service-definition.json"
echo ${SERVICE_CMD}
eval ${SERVICE_CMD}

UPDATE_CMD="curl --get --silent --show-error --output /tmp/service-update.json ${URL}/${GROUP_PATH}/${ARTIFACT_ID}/${VERSION}/${ARTIFACT_ID}-${VERSION}-service-update.json"
echo ${UPDATE_CMD}
eval ${UPDATE_CMD}

INSTALL_TASK_CMD="/usr/local/bin/aws ecs register-task-definition --region ${AWS_REGION} --cli-input-json file:///tmp/task-definition.json"
echo ${INSTALL_TASK_CMD}
eval ${INSTALL_TASK_CMD}

