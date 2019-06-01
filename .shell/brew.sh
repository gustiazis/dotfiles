#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Adds more repos to formulae.
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap homebrew/php

# Install GNU core utilities (those that come with macOS are outdated).
brew install coreutils

# Install GNU another utilities.
brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names

# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen

# Install other useful binaries.
brew install ack
brew install cocoapods
brew install ffmpeg
brew install gifsicle
brew install git
brew install git-lfs
brew install htop
brew install imagemagick
brew install mongodb
brew install ngrep
brew install node
brew install putty
brew install rename
brew install redis
brew install rtmpdump
brew install testssl
brew install tree
brew install watch
brew install watchman
brew install youtube-dl

# Install MySQL, PHP, and common formulae.
brew install mysql
brew install php56 --enable-maintainer-zts --build-from-source
brew install php56-igbinary --build-from-source
brew install php56-redis --build-from-source
brew install php56-mcrypt --build-from-source
brew install php56-memcached --build-from-source

# Remove outdated versions from the cellar.
brew cleanup
