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
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap homebrew/php

# Install GNU core utilities (those that come with OS X are outdated).
brew install coreutils

# Install GNU another utilities.
brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names

# Install Bash 4.
brew install bash
brew install bash-completion2

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install grep
brew install openssh
brew install screen

# Install other useful binaries.
brew install ack
# brew install exiv2
brew install git
brew install git-lfs
# brew install imagemagick --with-webp
# brew install lynx
brew install mongodb
brew install ngrep
brew install node
# brew install pv
# brew install rhino
brew install rename
brew install redis
brew install testssl
brew install tree
# brew install webkit2png
brew install youtube-dl
brew install zsh
brew install zsh-completions

# Install MySQL, PHP, and common formulae.
brew install mysql
brew install php56 --enable-maintainer-zts --build-from-source
brew install php56-igbinary --build-from-source
brew install php56-redis --build-from-source
brew install php56-mcrypt --build-from-source
# brew install phpmyadmin

# Remove outdated versions from the cellar.
brew cleanup
