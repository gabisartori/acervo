#!/bin/bash

# This script was made for a fresh installed ubuntu 22.04 jammy jellyfish

# Versions
NODE_VERSION="20" # LTS
RUBY_VERSION="3.3.0"

# Remove the ubuntu pro add from apt upgrade
sudo mv /etc/apt/apt.conf.d/20apt-esm-hook.conf /etc/apt/apt.conf.d/20apt-esm-hook.conf.bak
sudo touch /etc/apt/apt.conf.d/20apt-esm-hook.conf

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

# Installing everything
sudo apt update && sudo apt upgrade -y

# Apt packages
## Libs
sudo apt install libgl1-mesa-dri:i386 libssl-dev libreadline-dev zlib1g-dev libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev
# Programs
sudo apt install autoconf baobab build-essential ca-certificates curl gimp git htop krita  lutris mesa-vulkan-drivers mesa-vulkan-drivers:i386 neofetch net-tools pip python3-tk sqlite ssh vlc -y
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
## Firefox
sudo snap remove firefox
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla
sudo apt update && sudo apt install firefox
# Programming

## Python modules
pip3 install numpy pandas tensorflow scikit-learn matplotlib

sudo apt autoremove
sudo apt autoclean

## Ruby
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION

gem install rails

## NVM and Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install $NODE_VERSION

## Docker
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
