#!/bin/bash

aws cloudformation $ACTION \
    --region us-east-1 \
    --stack-name $STACK_NAME \
    --template-body file://service.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
    ParameterKey=DockerImage,ParameterValue=119541632154.dkr.ecr.us-east-1.amazonaws.com/example-webapp:$(git rev-parse HEAD) \
    ParameterKey=VPC,ParameterValue=vpc-ae36a9d4 \
    ParameterKey=Cluster,ParameterValue=homologacao \
    ParameterKey=Listener,ParameterValue=arn:aws:elasticloadbalancing:us-east-1:119541632154:listener/app/production-website/70aed30cb273b58b/63c43efa49905b7f
