#!/bin/bash

# Download and install Homebrew if it doesn't exist
brew --version >/dev/null 2>&1
if [ $? -gt 0 ]; then
    echo "Installing: macOS Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    brew tap caskroom/cask
fi
