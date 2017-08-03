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
yarn global add babel-cli
yarn global add babel-core
yarn global add babel-eslint
yarn global add babel-loader
yarn global add babel-preset-es2015
yarn global add babel-preset-react
yarn global add eslint
yarn global add eslint-plugin-react
yarn global add express
yarn global add phantomjs
yarn global add react
yarn global add react-dom
yarn global add react-native-cli
yarn global add redux
yarn global add webpack
yarn global add webpack-dev-server


# Clean npm packages cache.
npm cache clean
