#!/bin/bash

# Abort on error
set -e
set -o pipefail

# macOS specific configurations
if [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ "$1" == "macOS" ]]; then
        echo "Running script: macOS"
        ./osx.sh
    else
        echo "WARNING: Not running macOS scripts. Run again with macOS as first argument."
        sleep 5
    fi
fi

# Check for GNU stow and attempt to install if it doesn't exist
if [[ ! -x $(command -v stow) ]]; then
    if [[ -x $(command -v pacman) ]]; then
        sudo pacman -Syu stow
    elif [[ -x $(command -v apt) ]]; then
        sudo apt update
        sudo apt install stow
    elif [[ -x $(command -v brew) ]]; then
        brew update
        brew install stow
    else
        echo "Can't automatically install GNU Stow..."
        exit 127
    fi
fi

git submodule init
git submodule update

# Iterate over directories, run init script, and then stow it
for f in */; do
    dir=$(echo "$f" | sed 's/.$//')
    if [[ -x "./$dir/init.sh" ]]; then
        echo "Running script: $dir"
        ./$dir/init.sh
    fi
    echo "Running stow: $dir"
    stow --ignore='^init.sh$' $dir
done;
