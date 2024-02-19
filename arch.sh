#!/usr/bin/env zsh
#
if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="nvim,zsh,bin,tmux,kitty"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
fi

STOW_FOLDERS=$STOW_FOLDERS 
DOTFILES=$DOTFILES

# Run the Homebrew Script
echo "Installing stow"
sudo pacman -S stow

sh $DOTFILES/install.sh

echo "Installing brew packages"
./pacman.sh
