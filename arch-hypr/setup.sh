#!/bin/bash

pacman -S --needed git base-devel

# Install yay
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
cd .. && rm -rf yay-bin

# Install packages
yay -S --needed - < packages.list

# Config files
ln -sf "$(pwd)"/config/* ~/.config/

ln -sf "$(pwd)"/scripts/bashrc ~/.bashrc
ln -sf "$(pwd)"/scripts/bash_aliases ~/.bash_aliases
ln -sf "$(pwd)"/scripts/bash_venv ~/.bash_venv
ln -sf "$(pwd)"/scripts/bash_autocomplete ~/.bash_autocomplete

# Setup man-pages
mandb

# TODO: Setup sddm (Display manager aka Login manager)

# TODO: set kwallet password to be empty or to autounlock on login
# the empty option is what has worked until now

# Enable services
sudo systemctl enable sddm
sudo systemctl enable bluetooth

