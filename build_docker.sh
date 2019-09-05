#!/bin/bash

export VERSION=$(date '+%d%m%Y%H%M%S');

echo "Creating local docker image ......."
docker build --build-arg API_SECRET=$API_SECRET \
             -t hashicorp-demo:latest . -q

echo "Tag docker image latest version ......."
docker tag hashicorp-demo:latest 578612111946.dkr.ecr.us-west-1.amazonaws.com/hashicorp-demo:latest

echo "Tag docker image version number......."
docker tag hashicorp-demo:latest 578612111946.dkr.ecr.us-west-1.amazonaws.com/hashicorp-demo:$VERSION
