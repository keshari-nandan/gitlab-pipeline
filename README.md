# Gitlab Pipeline
 This image provides aws-cli that can be used in ```.gitlab-ci.yml``` as below - 
 ```yaml
image: thenandan/gitlab-pipeline:latest

variables:
  REPOSITORY_URL: account_id.dkr.region.amazonaws.com/project:latest

services:
  - docker:dind

stages:
  - build

build:
  stage: build
  script:
    - aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin account_id.dkr.ecr.region.amazonaws.com
    - docker build --file .docker/Dockerfile -t project .
    - docker tag project:latest $REPOSITORY_URL
    - docker push $REPOSITORY_URL

```
