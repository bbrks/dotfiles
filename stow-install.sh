#!/bin/bash

# Check for GNU stow and attempt to install if it doesn't exist
if [[ ! -x $(command -v stow) ]]; then
    if [[ -x $(command -v pacman) ]]; then
        echo "Installing GNU Stow with pacman..."
        run_cmd sudo pacman -Syu stow
    elif [[ -x $(command -v brew) ]]; then
        echo "Installing GNU Stow with brew..."
        run_cmd brew update
        run_cmd brew install stow
    elif [[ -x $(command -v apt) ]]; then
        echo "Installing GNU Stow with apt..."
        run_cmd sudo apt update
        run_cmd sudo apt install stow
    else
        echo "Can't automatically install GNU Stow... (no pacman, brew, or apt)"
        exit 127
    fi
fi