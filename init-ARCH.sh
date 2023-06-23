#!/bin/bash

# install yay if not installed
if [[ ! -x $(command -v yay) ]]; then
    pacman -Syu --needed git base-devel
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
    cd /tmp/yay-bin
    makepkg -si
    sudo pacman -U yay-bin-*.pkg.tar.zst
fi
