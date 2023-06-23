#!/bin/bash

run_cmd osascript -e 'tell application "System Preferences" to quit'

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
run_cmd sudo -v
while true; do run_cmd sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install command line tools
run_cmd xcode-select --install

# Quiet boot audio
run_cmd sudo nvram SystemAudioVolume="%01"

# Tap to click
run_cmd sudo defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2
run_cmd sudo defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
run_cmd sudo defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2
run_cmd sudo defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
run_cmd sudo defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
run_cmd sudo defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Expand the save panel by default
run_cmd defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
run_cmd defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
run_cmd defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
run_cmd defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Disable save to iCould
run_cmd defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
run_cmd defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable annoying autocorrect stuff
run_cmd defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
run_cmd defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
run_cmd defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
run_cmd defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
run_cmd defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable Photos.app from auto-starting
run_cmd defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Improve sound quality for Bluetooth devices
run_cmd defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Full keyboard access for all UI elements
run_cmd defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold special keys
run_cmd defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Increase keyboard repeat rate
run_cmd defaults write NSGlobalDomain KeyRepeat -int 2
run_cmd defaults write NSGlobalDomain InitialKeyRepeat -int 25

# Disable iTunes media keys
run_cmd launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Disable auto-brightness
run_cmd sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false
run_cmd sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool false

# Ask for password after sleep
run_cmd defaults write com.apple.screensaver askForPassword -int 1
run_cmd defaults write com.apple.screensaver askForPasswordDelay -int 5

# Show all extensions
run_cmd #defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Column view by default
run_cmd defaults write com.apple.finder FXPreferredViewStyle Clmv

# Disable .DS_Store on network volumes
run_cmd defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Wipe dock icons
run_cmd #defaults write com.apple.dock persistent-apps -array

# Shrink dock icon size
run_cmd defaults write com.apple.dock tilesize -int 64

# Show hidden icons on dock
run_cmd defaults write com.apple.dock showhidden -bool true

# Dock autohide and speed up animations
run_cmd defaults write com.apple.dock autohide -bool true
run_cmd defaults write com.apple.dock autohide-delay -int 0
run_cmd defaults write com.apple.dock autohide-time-modifier -float 0.075

# Speed up mission control animations
run_cmd defaults write com.apple.dock expose-animation-duration -float 0.075
run_cmd defaults write com.apple.dock "expose-group-by-app" -bool true

# Speed up window animations
run_cmd defaults write NSGlobalDomain NSWindowResizeTime -float 0.075
run_cmd defaults write com.apple.finder DisableAllAnimations -bool true

# Mission Control
run_cmd defaults write com.apple.dock mru-spaces -bool false

# Keep Safari searches private
run_cmd defaults write com.apple.Safari UniversalSearchEnabled -bool false
run_cmd defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Hide Safari bookmarks
run_cmd defaults write com.apple.Safari ShowFavoritesBar -bool false
run_cmd defaults write com.apple.Safari ShowSidebarInTopSites -bool false
run_cmd defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable Safari developer mode
run_cmd defaults write com.apple.Safari IncludeDevelopMenu -bool true
run_cmd defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
run_cmd defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
run_cmd defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

run_cmd defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
run_cmd defaults write com.apple.Safari HomePage -string "about:blank"

# Disable Time-Machine nags
run_cmd defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

run_cmd killall Dock
run_cmd killall Finder

# iTerm Settings
run_cmd defaults write com.googlecode.iterm2 PromptOnQuit -bool false
run_cmd open "iterm/.iterm/gruvbox-dark.itermcolors"

# SizeUp
run_cmd defaults write com.irradiatedsoftware.SizeUp StartAtLogin -bool true
run_cmd defaults write com.irradiatedsoftware.SizeUp ShowPrefsOnNextStart -bool false
