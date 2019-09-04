echo "Set AWS Credential ......."
export AWS_ACCESS_KEY_ID=$(jq -r .data.access_key <<< $CRED_JSON)
export AWS_SECRET_ACCESS_KEY=$(jq -r .data.secret_key <<< $CRED_JSON)
export AWS_DEFAULT_REGION=ap-southeast-2

echo "Log in to ECR ........"
aws ecr get-login --no-include-email --region us-west-1 | sh

echo "Pushing image to ECR !!!!!!!"
docker push 578612111946.dkr.ecr.us-west-1.amazonaws.com/hashicorp-demo:latest
