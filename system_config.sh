#!/bin/bash

# Run this script as sudo.
# The script will automatically install the packages commonly used 
# by me. It will also add any aliases/configurations that I am used to.
# This will be updated periodically (maybe). 


apt update

# Programming stuff
snap install --classic code
snap install --classic valgrind
apt install -y build-essential
apt install -y git

# Tooling
apt install -y net-tools

# Configuration
cp ./keybindings.json ~/.config/Code/User/keybindings.json # vscode shortcuts

# Add Docker 
apt update
apt install -y ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
   tee /etc/apt/sources.list.d/docker.list > /dev/null


apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Cleanup
apt autoremove


# Manual actions required to finish
clear
printf "run the following commands to finish configuring your computer:
git config --global user.email \"<email>\"
git config --global user.name \"<name>\"

select-editor
"
