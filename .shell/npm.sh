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
npm install -g babel-cli
npm install -g babel-core
npm install -g babel-eslint
npm install -g babel-loader
npm install -g babel-preset-es2015
npm install -g babel-preset-react
npm install -g eslint
npm install -g eslint-plugin-react
npm install -g express
npm install -g imageoptim-cli
npm install -g json-server
npm install -g npm
npm install -g phantomjs
npm install -g react
npm install -g react-dom
npm install -g react-native-cli
npm install -g react-router
npm install -g redux
npm install -g socket.io
npm install -g webpack
npm install -g webpack-dev-server
npm install -g write-good
npm install -g yarn


# Clean npm packages cache.
npm cache clean
