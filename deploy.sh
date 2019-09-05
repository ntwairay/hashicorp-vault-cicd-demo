#!/bin/bash

export VERSION=$(date '+%d%m%Y%H%M%S');

echo "Creating local docker image ......."
docker build --build-arg API_SECRET=$API_SECRET \
             -t hashicorp-demo:latest . -q

echo "Log in to ECR ........"
aws ecr get-login --no-include-email --region us-west-1 | sh


echo "Tag docker image version number and push to ECR......."
docker tag hashicorp-demo:latest 578612111946.dkr.ecr.us-west-1.amazonaws.com/hashicorp-demo:$VERSION
docker push 578612111946.dkr.ecr.us-west-1.amazonaws.com/hashicorp-demo:$VERSION

echo "Tag docker image latest version and push to ECR ......."
docker tag hashicorp-demo:latest 578612111946.dkr.ecr.us-west-1.amazonaws.com/hashicorp-demo:latest
docker push 578612111946.dkr.ecr.us-west-1.amazonaws.com/hashicorp-demo:latest
