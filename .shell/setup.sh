#!/usr/bin/env bash

# Add the new shell to the list of allowed shells.
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell.
chsh -s /usr/local/bin/bash

# Symlink gsha256sum to sha256sum.
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Configure Sublime Text as the Git Mergetool.
git config --global mergetool.sublime.cmd "subl -w \$MERGED"
git config --global mergetool.sublime.trustExitCode false
git config --global merge.tool sublime
git mergetool -y

# Create Symlink Sublime Text.
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# Install Package Control for Sublime Text from Console.
# Ref : https://packagecontrol.io/installation#st3 - Sublime Text 3.
# import urllib.request,os,hashlib; h = '2915d1851351e5ee549c20394736b442' + '8bc59f460fa1548d1514676163dafc88'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)

# Packages for Sublime Text.

# Alignment
# Babel
# Babel Snippets
# DocBlockr
# Git
# Javascript & NodeJS Snippets
# SublimeLinter
# SublimeLinter-contrib-eslint
# Tag
# TrailingSpaces
# VimL

# Tweaks for Sublime Text.

# ColorSchemeEditor
# PackageResourceViewer
# Theme - Spacegray
