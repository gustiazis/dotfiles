#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest NPM.
npm install npm -g

# Update any already-installed packages.
npm update -g

# Install packages for Node.
# npm install -g @babel-cli
# npm install -g @babel/eslint-parser
# npm install -g eslint
# npm install -g expo-cli
# npm install -g react-devtools
# npm install -g @react-native-community/cli
# npm install -g write-good


# Clean npm packages cache.
npm cache clean
