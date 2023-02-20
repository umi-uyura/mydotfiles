#!/usr/bin/env bash
# _setup.sh

#
# Copy dot-files to HOME
#

cd "$(dirname "$0")" || exit
for dotfile in .?*
do
    if [ "$dotfile" != '..' ] && [ "$dotfile" != '.git' ]
    then
        if ! ln -Fis "$PWD/$dotfile" "$HOME"; then
            echo created "$HOME/$dotfile"
        fi
    fi
done

if [ "$(uname)" == 'Darwin' ]; then
    for dots in $HOME/dotfiles/dots/macos/{.bashrc,.bash_profile}; do
        file=$(basename "$dots")
        if [ ! -a "$HOME/$file" ]; then
            if ! ln -Fis "$dots" "$HOME"; then
                echo created "$HOME/$file"
            fi
        fi
    done;
    unset file; unset dots;
fi

#
# Additonal messages
#

if [ "$(uname)" == 'Linux' ]; then
  # Linux
  echo
  if [[ "$(uname -r)" == *microsoft* ]]; then
    # WSL
    echo
    echo "**Take additional steps**"
    echo "- Copy wsl.conf (dotfiles/dots/wsl/etc/wsl.conf) to /etc/wsl.conf"
    echo "  $ sudo cp wsl.conf /etc"
    echo
  fi
elif [ "$(uname)" == 'Darwin' ]; then
  # macOS
  echo
else
  # Windows
  echo
fi
