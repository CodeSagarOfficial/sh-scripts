#!/bin/bash

# Check if Terraform is installed
if ! command -v terraform &> /dev/null; then
    # Update package list
    sudo apt-get update

    # Install unzip (needed to extract Terraform)
    sudo apt-get install -y unzip

    # Download the Terraform binary
    wget https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_amd64.zip

    # Unzip the Terraform binary
    unzip terraform_1.7.4_linux_amd64.zip

    # Move the Terraform binary to a directory in your PATH
    sudo mv terraform /usr/local/bin/

    # Remove zip file
    rm terraform_1.7.4_linux_amd64.zip
fi

# Verify the installation
terraform --version
