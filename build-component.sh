#!/usr/bin/env bash

#globals
COMPONENT_NAME=$1
TAG_TEMP=$2
TAG=${TAG_TEMP:=1.0}
TEMP=$3
PUSH=${TEMP:=-NO}
# IMAGE=docker-bakery-system/${COMPONENT_NAME}:${TAG}
IMAGE=poojan23/docker-bakery-system_${COMPONENT_NAME}:${TAG}

function ping(){
    echo "Building from docker file path::"
}
function check_component() {
   echo "COMPONENT_NAME: " ${COMPONENT_NAME}
  case ${COMPONENT_NAME} in
    repo9-component1)
    DOCKERFILE_PATH=./components_repo9/test-component1_repo9/Dockerfile
    ;;
    repo9-component2)
    DOCKERFILE_PATH=./components_repo9/test-component2_repo9/Dockerfile
    ;;
    repo9-component3)
    DOCKERFILE_PATH=./components_repo9/test-component3_repo9/Dockerfile
    ;;
    *)
      echo "Invalid component" && exit 1 ;;
  esac
  echo "<Building Image>
        dockerfile path ::" ${DOCKERFILE_PATH}"
        tag             ::" ${TAG}
}


function build()
{
    docker build -t ${IMAGE} -f "${DOCKERFILE_PATH}" .
}


check_component
build


