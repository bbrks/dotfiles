#!/bin/bash



# MacOS specific configurations
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Running script: macOS"
    ./osx.sh
fi



# Check for GNU stow and attempt to install if it doesn't exist
stow --version >/dev/null 2>&1
if [ $? -gt 0 ]; then
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        echo "Installing: stow"
        sudo apt update
        sudo apt install stow
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Installing: stow"
        brew update
        brew install stow
    else
        echo 'GNU Stow must be installed...'
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
