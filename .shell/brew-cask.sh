#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Adds more repos to formulae.
brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts

# Install Quick Look Plugins.
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install qlprettypatch
brew cask install quicklook-json
brew cask install quicklook-csv
brew cask install betterzipql
# brew cask install qlimagesize
brew cask install webpquicklook
brew cask install suspicious-package
brew cask install qlvideo
brew cask install provisionql

# Install Apps.
# brew cask install aerial
brew cask install android-studio
brew cask install appcleaner
brew cask install cheatsheet
# brew cask install cleartext
brew cask install cyberduck
# brew cask install disk-doctor
brew cask install genymotion
# brew cask install icons8
# brew cask install handbrake
# brew cask install id3-editor
# brew cask install imagealpha
# brew cask install imageoptim
brew cask install inkscape
brew cask install iterm2
# brew cask install jpegmini
brew cask install java
brew cask install spectacle
brew cask install spotify
brew cask install sublime-text3
brew cask install teamviewer
brew cask install the-unarchiver
brew cask install torbrowser
brew cask install transmission
brew cask install virtualbox
brew cask install vlc
# brew cask install xampp
brew cask install xquartz

# Install Fonts.
brew cask install font-source-code-pro
brew cask install font-office-code-pro
brew cask install font-open-sans
# brew cask install font-segoe-ui

# Remove outdated versions from the cellar.
brew cask cleanup
