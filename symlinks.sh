#!/usr/bin/env bash

# List Files to Symlink.
files=".bash_aliases .bash_functions .bash_path .bash_profile .bash_prompt .bashrc .gitconfig .gitignore .inputrc"

for file in $files; do
  rm -rf $HOME/$file > /dev/null
  ln $PWD/$file $HOME/$file
done

unset files
echo "Done"
