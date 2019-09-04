#!/bin/bash

echo "Get Secret ......."
export API_SECRET=$(jq -r .data.API_KEY <<< $SECRET_JSON)

echo "Creating local docker image ......."
docker build --build-arg API_SECRET=$API_SECRET \
             -t hashicorp-demo:latest . -q

echo "Tag docker image ......."
docker tag hashicorp-demo:latest 578612111946.dkr.ecr.us-west-1.amazonaws.com/hashicorp-demo:latest
