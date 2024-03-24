#!/usr/bin/env zsh
#
if [[ -z $STOW_FOLDERS ]]; then
    export STOW_FOLDERS="nvim,zsh,bin,tmux,kitty"
fi

if [[ -z $DOTFILES ]]; then
    export DOTFILES=$HOME/.dotfiles
fi


# Run the Homebrew Script
echo "Installing stow"
sudo dnf install stow

sh $DOTFILES/install.sh

# ./dnf.sh
