# Gitlab Pipeline
 This image provides aws-cli that can be used in ```.gitlab-ci.yml``` as below - 
 ```yaml
image: thenandan/gitlab-pipeline:latest

variables:
  REPOSITORY_URL: $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$PROJECT_NAME:latest

services:
  - docker:dind

stages:
  - build

build:
  stage: build
  script:
    - aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com
    - docker build --file Dockerfile -t $PROJECT_NAME .
    - docker tag $PROJECT_NAME:latest $REPOSITORY_URL
    - docker push $REPOSITORY_URL

```

# AWS Credentials
Following AWS KEYS is required to push the image to ECR.
- AWS_ACCESS_KEY_ID 
- AWS_DEFAULT_REGION
- AWS_SECRET_ACCESS_KEY
- AWS_ACCOUNT_ID
- PROJECT_NAME

*Note:* Make sure you have the repository as you project name in AWS ECR. 
