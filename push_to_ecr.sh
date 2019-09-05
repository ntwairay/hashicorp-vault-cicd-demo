#!/bin/bash

echo "Log in to ECR ........"
aws ecr get-login --no-include-email --region us-west-1 | sh

echo "Pushing image to ECR !!!!!!!"
docker push 578612111946.dkr.ecr.us-west-1.amazonaws.com/hashicorp-demo:latest
docker push 578612111946.dkr.ecr.us-west-1.amazonaws.com/hashicorp-demo:$VERSION
