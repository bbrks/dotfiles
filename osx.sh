#!/bin/bash

osascript -e 'tell application "System Preferences" to quit'

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Mute boot audio
sudo nvram SystemAudioVolume=" "

# Tap to click
sudo defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
sudo defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
sudo defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Expand the save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Disable save to iCould
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable annoying autocorrect stuff
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable Photos.app from auto-starting
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Improve sound quality for Bluetooth devices
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Full keyboard access for all UI elements
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold special keys
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Increase keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# Disable iTunes media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Disable auto-brightness
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool false

# Ask for password after sleep
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 5

# Show all extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Column view by default
defaults write com.apple.finder FXPreferredViewStyle Clmv

# Disable .DS_Store on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Wipe dock icons
defaults write com.apple.dock persistent-apps -array

# Shrink dock icon size
defaults write com.apple.dock tilesize -int 64

# Show hidden icons on dock
defaults write com.apple.dock showhidden -bool true

# Dock autohide and speed up animations
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.075

# Speed up mission control animations
defaults write com.apple.dock expose-animation-duration -float 0.075
defaults write com.apple.dock "expose-group-by-app" -bool true

# Speed up window animations
defaults write NSGlobalDomain NSWindowResizeTime -float 0.075
defaults write com.apple.finder DisableAllAnimations -bool true

# Mission Control
defaults write com.apple.dock mru-spaces -bool false

# Keep Safari searches private
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Hide Safari bookmarks
defaults write com.apple.Safari ShowFavoritesBar -bool false
defaults write com.apple.Safari ShowSidebarInTopSites -bool false
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable Safari developer mode
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write com.apple.Safari HomePage -string "about:blank"

# Disable Time-Machine nags
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

killall Dock
killall Finder

# Download and install Homebrew if it doesn't exist
brew --version >/dev/null 2>&1
if [ $? -gt 0 ]; then
    echo "Installing: macOS Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew analytics off

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions

brew install archey git go htop jump stow vim
brew cask install aerial atom daisydisk dash docker firefox-developer-edition flux iterm2 sizeup skype spotify spotify-notifications sublime-text texpad the-unarchiver tunnelblick vlc
brew cask install font-go font-go-medium font-go-mono

# iTerm Settings
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
open "iterm/.iterm/gruvbox-dark.itermcolors"

# SizeUp
defaults write com.irradiatedsoftware.SizeUp StartAtLogin -bool true
defaults write com.irradiatedsoftware.SizeUp ShowPrefsOnNextStart -bool false

