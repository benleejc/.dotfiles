#!/usr/bin/env zsh
#
if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="nvim,zsh,alacritty,bin,tmux"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
fi

STOW_FOLDERS=$STOW_FOLDERS 
DOTFILES=$DOTFILES

# Run the Homebrew Script
echo " Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Homebrew installed!"

echo "Installing stow"
brew install stow

sh $DOTFILES/install.sh

echo "Installing brew packages"
./brew.sh

