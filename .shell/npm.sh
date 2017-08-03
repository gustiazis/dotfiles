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
npm install -g imageoptim-cli
npm install -g json-server
npm install -g npm
npm install -g write-good
npm install -g yarn

# Install packages for Node using Yarn.
yarn global add -g babel-cli
yarn global add -g babel-core
yarn global add -g babel-eslint
yarn global add -g babel-loader
yarn global add -g babel-preset-es2015
yarn global add -g babel-preset-react
yarn global add -g eslint
yarn global add -g eslint-plugin-react
yarn global add -g express
yarn global add -g phantomjs
yarn global add -g react
yarn global add -g react-dom
yarn global add -g react-native-cli
yarn global add -g redux
yarn global add -g webpack
yarn global add -g webpack-dev-server


# Clean npm packages cache.
npm cache clean
