#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install Quick Look Plugins.
brew install --cask provisionql
brew install --cask qlcolorcode
# brew install --cask qlimagesize
brew install --cask qlmarkdown
brew install --cask qlprettypatch
brew install --cask qlstephen
brew install --cask qlvideo
brew install --cask quicklookapk
brew install --cask quicklook-csv
brew install --cask quicklook-json
brew install --cask webpquicklook
brew install --cask betterzip
brew install --cask suspicious-package

# Install Apps.
# brew install --cask aerial
brew install --cask android-studio
brew install --cask appcleaner
brew install --cask cheatsheet
brew install --cask cleartext
brew install --cask cyberduck
# brew install --cask disk-doctor
brew install --cask firefox
# brew install --cask genymotion
brew install --cask google-chrome
# brew install --cask handbrake
brew install --cask imagealpha
brew install --cask imageoptim
# brew install --cask inkscape
# brew install --cask iterm2
# brew install --cask jpegmini
brew install --cask postman
# brew install --cask robo-3t
brew install --cask sequel-pro
brew install --cask studio-3t
brew install --cask spectacle
brew install --cask spotify
brew install --cask sublime-text
# brew install --cask teamviewer
brew install --cask the-unarchiver
brew install --cask tor-browser
brew install --cask transmission
# brew install --cask virtualbox
brew install --cask vlc
# brew install --cask xampp
# brew install --cask xquartz

brew install maven
brew tap AdoptOpenJDK/openjdk
brew install --cask adoptopenjdk8

# Remove outdated versions from the cellar.
brew cleanup
