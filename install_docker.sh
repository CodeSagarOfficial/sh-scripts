#!/bin/bash

# Check if Docker is installed
if command -v docker &> /dev/null; then
    # Docker is already installed, so display the version
    docker --version
else
    # Docker is not installed, so install it
    # Update the apt package index
    sudo apt update

    # Install packages to allow apt to use a repository over HTTPS
    sudo apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    # Add Docker's official GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Set up the stable repository
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Update the apt package index again
    sudo apt update

    # Install Docker CE (Community Edition)
    sudo apt install -y docker-ce docker-ce-cli containerd.io

    # Display Docker version
    docker --version
fi
