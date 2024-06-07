#!/bin/bash

# Define variables
DOCKER_USERNAME="your_docker_username"
DOCKER_PASSWORD="your_docker_password"
DOCKER_IMAGE_NAME="your_docker_image_name"
DOCKER_IMAGE_TAG="latest"
TERRAFORM_SCRIPT="path_to_your_terraform_script.sh"

# Log in to Docker Hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Build the Docker image
docker build -t "$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG" .

# Push the Docker image to Docker Hub
docker push "$DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG"

# Run the Terraform script
bash "$TERRAFORM_SCRIPT"
