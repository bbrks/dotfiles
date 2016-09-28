#!/bin/sh



# MacOS specific configurations
if [[ "$OSTYPE" == "darwin"* ]]; then
    ./osx.sh
fi



# Check for GNU stow and attempt to install if it doesn't exist
stow --version >/dev/null 2>&1
if [ $? -gt 0 ]; then
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        sudo apt update
        sudo apt install stow
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew update
        brew install stow
    else
        echo 'GNU Stow must be installed...'
        exit 127
    fi
fi



echo 'Updating submodules...'
git submodule init
git submodule update



for f in */; do
    srv=$(echo "$f" | sed 's/.$//')
    echo "Initialising $srv"
    ./$srv.sh
done;
