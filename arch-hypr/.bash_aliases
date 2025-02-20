#! /bin/bash

alias ll="ls -la"
alias la="ls -a"
alias upd="sudo pacman -Syu"

alias yt-dlp-mp3="yt-dlp -x --audio-format mp3 --embed-thumbnail -o"
alias yt-dlp-playlist="yt-dlp -x --audio-format mp3 --embed-thumbnail -a"

alias otpappend="wl-paste | zbarimg -q --raw - | pass otp append "

alias pacfind="pacman -Q | grep"

alias pass="EDITOR=nvim pass"

