#!/bin/bash

# This script was made for a fresh installed ubuntu 22.04 jammy jellyfish

# Enable 32-bit architecture
sudo dpkg --add-architecture i386 

# Download wine repository key
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources

# Feed github desktop package
# wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
# sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'

# Adding video drivers repositories
sudo add-apt-repository ppa:kisak/kisak-mesa

# Install NVM and Node.js at LTS version
NODE_VERSION="20" # LTS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install $NODE_VERSION

# Installing everything
sudo apt update && sudo apt upgrade -y

# Apt packages
sudo apt install baobab lutris sqlite pip vlc git libgl1-mesa-dri:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386 krita gimp htop neofetch net-tools ssh python3-tk -y
sudo apt install --install-recommends winehq-devel -y

# Deb packages
## Discord
curl -s -L --output /tmp/discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo dpkg -i /tmp/discord.deb
## Minecraft
curl -s -L --output /tmp/minecraft.deb "https://launcher.mojang.com/download/Minecraft.deb"
sudo dpkg -i /tmp/minecraft.deb
## Steam
curl -s -L --output /tmp/steam.deb "https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb"
sudo dpkg -i /tmp/steam.deb
## Visual Studio Code
curl -s -L --output /tmp/vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo dpkg -i /tmp/vscode.deb
## Libre Office
mkdir /tmp/libreoffice_deb
### Libre Office
curl -s -L --output /tmp/libreoffice_deb.tar.gz "https://download.documentfoundation.org/libreoffice/stable/7.6.6/deb/x86_64/LibreOffice_7.6.6_Linux_x86-64_deb.tar.gz"
tar -xvf /tmp/libreoffice_deb.tar.gz -C /tmp/libreoffice_deb
### Translation pt-br
curl -s -L --output /tmp/libreoffice_pt_br_deb.tar.gz "https://download.documentfoundation.org/libreoffice/stable/7.6.6/deb/x86_64/LibreOffice_7.6.6_Linux_x86-64_deb_langpack_pt-BR.tar.gz"
tar -xvf /tmp/libreoffice_pt_br_deb.tar.gz -C /tmp/libreoffice_deb
### Help Pack pt-br
curl -s -L --output /tmp/libreoffice_helppack_pt_br_deb.tar.gz "https://download.documentfoundation.org/libreoffice/stable/7.6.6/deb/x86_64/LibreOffice_7.6.6_Linux_x86-64_deb_helppack_pt-BR.tar.gz"
tar -xvf /tmp/libreoffice_helppack_pt_br_deb.tar.gz -C /tmp/libreoffice_deb

sudo dpkg --recursive -i /tmp/libreoffice_deb

# Python modules
pip3 install numpy pandas tensorflow scikit-learn matplotlib

sudo apt autoremove
sudo apt autoclean


