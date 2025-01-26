#!/bin/sh
pkill waybar
waybar &
waybar --config ~/.config/waybar/config-bottom.jsonc &

