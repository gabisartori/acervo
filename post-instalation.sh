#!/bin/bash

# This script was made for a fresh installed ubuntu 22.04 jammy jellyfish

# Enable 32-bit architecture
sudo dpkg --add-architecture i386 

# Download wine repository key
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources

# Feed github desktop package
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'

# Adding video drivers repositories
sudo add-apt-repository ppa:kisak/kisak-mesa

# Install NVM and Node.js at LTS version
NODE_VERSION="20" # LTS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install $NODE_VERSION

# Installing everything
sudo apt update && sudo apt upgrade -y

# Apt packages
sudo apt install baobab lutris sqlite pip vlc git github-desktop libgl1-mesa-dri:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386 nodejs krita gimp htop neofetch net-tools ssh python3-tk -y
sudo apt install --install-recommends winehq-devel -y

# Python modules
pip3 install numpy pandas tensorflow scikit-learn matplotlib

sudo apt autoremove
sudo apt autoclean


