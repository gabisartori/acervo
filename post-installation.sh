#!/bin/bash

# This script was made for a fresh installed ubuntu 22.04 jammy jellyfish

# Functions
function install_deb() {
  curl -s -L --output /tmp/$1.deb $2
  sudo dpkg -i /tmp/$1.deb
  echo "Installed $1"
}

# Variables
## List files
APT_LIST="./install/apt.txt"
APT_REPOS_LIST="./install/apt-repos.txt"
DEB_LIST="./install/deb.txt"
PIP_LIST="./install/pip.txt"

## Versions
NODE_VERSION="20" # LTS
RUBY_VERSION="3.3.0"

# Remove the ubuntu pro add from apt upgrade
sudo mv /etc/apt/apt.conf.d/20apt-esm-hook.conf /etc/apt/apt.conf.d/20apt-esm-hook.conf.bak
sudo touch /etc/apt/apt.conf.d/20apt-esm-hook.conf

# Enable 32-bit architecture
sudo dpkg --add-architecture i386 

# Create folder for repository keys 
sudo mkdir -pm755 /etc/apt/keyrings

# Download Wine repository key
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources

# Feed github desktop package
# wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
# sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'

# Adding repositories
if [[-f "$APT_REPOS_LIST"]]; then
  grep -vE '^\s*($|#)' $APT_REPOS_LIST | while IFS= read -r line; do
    sudo add-apt-repository "$line"
  done
else
  echo "No repositories to add"
fi

# Installing everything
sudo apt update && sudo apt upgrade -y

# Apt packages
if [[-f "$APT_LIST"]]; then
  grep -vE '^\s*($|#)' $APT_LIST | xargs sudo apt install -y
else
  echo "No apt packages to install"
fi

## Wine because of course it was gonna be different
sudo apt install --install-recommends winehq-devel -y

# Deb packages
if [[-f "$DEB_LIST"]]; then
  grep -vE '^\s*($|#)' $DEB_LIST | while IFS= read -r line; do
    read -r filepath url <<< "$line"
    install_deb $filepath $url
  done
else
  echo "No deb packages to install"
fi

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
if [[-f "$PIP_LIST"]]; then
  grep -vE '^\s*($|#)' $PIP_LIST | xargs pip3 install 
else
  echo "No pip packages to install"
fi

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

sudo apt autoremove -y
sudo apt autoclean -y
