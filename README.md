# Gitlab Pipeline
 This docker image can be used in ```.gitlab-ci.yml``` as below - 
 ```yaml
image: thenandan/gitlab-pipeline:1.0.3

stages:
  - preparation

php:
  stage: preparation
  script:
    - php -v
composer:
  stage: preparation
  script:
    - composer -v
git:
  stage: preparation
  script:
    - git --version
docker:
  stage: preparation
  script:
    - docker -v
aws:
  stage: preparation
  script:
    - aws --version

```
