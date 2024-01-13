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
        if [ "$dotfile" == '.config' ] && [ -d "$HOME/$dotfile" ]; then
            # TODO: Create symlink to config file that in each directory
            :
        elif [ "${dotfile##*.}" == "example" ]; then
            localfile=${dotfile%.*}
            cp "$dotfile" "$HOME/$localfile"
        elif ! ln -Fis "$PWD/$dotfile" "$HOME"; then
            echo created "$HOME/$dotfile"
        fi
    fi
done

if [ "$(uname)" == 'Linux' ]; then
    if [ -e "$HOME/.bashrc" ] && [ ! -L "$HOME/.bashrc" ]; then
        echo NOTICE: Insert code to load my .bashrc into "$HOME/.bashrc"
        cat - <<EOF >> "$HOME/.bashrc"

# Load my .bashrc
if [ -f "\$HOME/.bashrc_basis" ]; then
  . "\$HOME/.bashrc_basis"
fi
EOF
    fi
fi

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
