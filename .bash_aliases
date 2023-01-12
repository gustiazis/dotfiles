#!/usr/bin/env bash

# Easier Navigations.
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias ~="cd ~"
alias ~~="cd -"

# Shortcuts.
alias c="clear"
alias g="git"
alias o="open"
alias dev="cd ~/Developments"
alias nlg="npm list -g --depth=0 2>/dev/null"
alias nll="npm list --depth=0 2>/dev/null"

# Command Shortcuts.
alias sudo="sudo "
alias md='mkdir -p'
alias rf="rm -fr"
alias paths='echo $PATH | tr -s ":" "\n"' # Pretty Print $PATH
alias functions='typeset -F' # Get List Declared Functions

# Applications.
alias safari="open -a Safari"
alias chrome="open -a Google\ Chrome"
alias firefox="open -a Firefox"
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
# alias watch="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app"
alias cleanup-simulator="xcrun simctl erase all"

# URLs.
alias github="chrome 'http://github.com/gustiazis'"

# Detect Which `ls` flavor is in use.
if ls --color > /dev/null 2>&1; then # GNU `ls`
	lsflag="--color --group-directories-first"
else # macOS `ls`
	lsflag="-G"
fi

# Always use color output for `ls`.
alias ls="command ls ${lsflag}"

# List all files colorized in long format.
alias ll="ls -lF ${lsflag}"

# List all files colorized in long format, including hidden files.
alias la="ls -laF ${lsflag}"

# List all files colorized in long format, including hidden files, sort by date.
alias ld="ls -latF ${lsflag}"

# Always enable colored `grep` output.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Get macOS Software Updates, Update Installed Homebrew, NPM, and Ruby Gems.
alias update-macos='sudo softwareupdate -i -a'
alias update-brew='brew update; brew upgrade; brew cleanup'
alias update-npm='npm install npm -g; npm update -g; npm cache clean'
alias update-gem='sudo gem update --system; sudo gem update; sudo gem cleanup'
alias update-all='update-macos; update-brew; update-npm; update-gem'

# IP Addresses.
alias ipp="dig +short myip.opendns.com @resolver1.opendns.com"
alias ipl="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias dns="scutil --dns | grep 'nameserver\[[0-9]*\]'"
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush DNS Cache.
alias flush-dns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu.
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder;"

# Clear bash history completely.
alias cleanup-history="cat /dev/null > ~/.bash_history && history -c && exit"

# Recursively delete `.DS_Store` files.
alias cleanup-dss="find . -type f -name '*.DS_Store' -ls -delete"

# Recursively remove all empty directories.
alias cleanup-empty-folders="find . -type d -empty -delete"

# Recursively delete `.localized` files.
alias cleanup-localized="find . -type f -name '*.localized' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine.
alias cleanup-trash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Show/Hide hidden files in Finder.
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/Show all desktop icons.
alias hide-desktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias show-desktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Disable/Enable Spotlight.
alias spotlight-off="sudo mdutil -a -i off"
alias spotlight-on="sudo mdutil -a -i on"

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# Lock the screen.
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Kill all the tabs in Chrome to free up memory.
alias chrome-kill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Check Internet Connection Speed.
alias speedtest='curl -o /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'

# Reload the shell (i.e. invoke as a login shell).
alias reload="exec $SHELL -l"

# Canonical hex dump; some systems have this symlinked.
command -v hd > /dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback.
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback.
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# JavaScriptCore REPL.
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
unset jscbin;
