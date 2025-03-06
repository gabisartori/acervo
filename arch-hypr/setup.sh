#!/bin/bash

pacman -S --needed git base-devel

# Install yay
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
cd .. && rm -rf yay-bin

# Install packages
yay -S --needed - < packages.list

# Config files
ln -sf "$(pwd)"/config/* ~/.config/

# Setup man-pages
mandb

