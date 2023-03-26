#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Xcode.
xcode-select --install

# Install Homebrew.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Executes All.
source macos.sh
source brew.sh
source brew-cask.sh
source setup.sh
source ../symlinks.sh

# Finally.
echo 'Initializations Finish. Note that some of these changes require a logout/restart to take effect.'
