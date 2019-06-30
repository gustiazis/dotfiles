#!/usr/bin/env bash

# Add the new shell to the list of allowed shells.
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell.
chsh -s /usr/local/bin/bash

# Configure Sublime Text as the Git Mergetool.
git config --global mergetool.sublime.cmd "subl -w \$MERGED"
git config --global mergetool.sublime.trustExitCode false
git config --global merge.tool sublime
git mergetool -y

# Install Package Control for Sublime Text from Console.
# Ref : https://packagecontrol.io/installation#st3 - Sublime Text 3.
# import urllib.request,os,hashlib; h = '6f4c264a24d933ce70df5dedcf1dcaee' + 'ebe013ee18cced0ef93d5f746d80ef60'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)

# Packages for Sublime Text.

# Babel
# Babel Snippets
# ColorSchemeEditor
# DocBlockr
# Git
# GraphQL
# Javascript & NodeJS Snippets
# JsPrettier
# PackageResourceViewer
# rsub
# SublimeLinter
# SublimeLinter-eslint
# Swift
# TrailingSpaces
# VimL

# Tweaks for Sublime Text.

# ColorSchemeEditor
# PackageResourceViewer
# Theme - Spacegray
