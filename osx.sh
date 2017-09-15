#!/bin/bash

defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.4
killall Dock

# Download and install Homebrew if it doesn't exist
brew --version >/dev/null 2>&1
if [ $? -gt 0 ]; then
    echo "Installing: macOS Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    brew tap caskroom/cask
    brew tap caskroom/fonts

    brew install archey git go htop jump stow vim
    brew cask install atom cathode dasiydisk dash docker google-chrome iterm2 jadengeller-helium sizeup skype spotify spotify-notifications sublime-text texpad the-unarchiver tunnelblick vlc
    brew cask install font-go font-go-medium font-go-mono

fi
