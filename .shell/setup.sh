#!/usr/bin/env bash

# Add the new shell to the list of allowed shells.
sudo bash -c 'echo $(brew --prefix)/bin/bash >> /etc/shells'
# Change to the new shell.
chsh -s $(brew --prefix)/bin/bash
# Create symlink to the new shell.
ln -s $(brew --prefix)/bin /usr/local/

# Configure Sublime Text as the Git Mergetool.
git config --global mergetool.sublime.cmd "subl -w \$MERGED"
git config --global mergetool.sublime.trustExitCode false
git config --global merge.tool sublime

# Create version manager directories
mkdir ~/.nvm
mkdir ~/.rbenv
mkdir ~/.pyenv

# Allow quicklook plugins
xattr -cr ~/Library/QuickLook/*.qlgenerator

# Setup Preferences (.prefs)