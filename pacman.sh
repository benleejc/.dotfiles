#!/usr/bin/env zsh

# Install Brew Packages
sudo pacman -S tree
sudo pacman -S htop
sudo pacman -S neovim
sudo pacman -S tmux
sudo pacman -S mosh
sudo pacman -S fzf
sudo pacman -S fd
sudo pacman -S pngpaste

# Install MacOS Applications
sudo pacman -S firefox
sudo pacman -S spotify
sudo pacman -S obsidian
sudo pacman -S plex
sudo pacman -S telegram
sudo pacman -S trader-workstation
sudo pacman -S iterm2
sudo pacman -S slack
sudo pacman -S rectangle
sudo pacman -S jesseduffield/lazygit/lazygit

brew tap homebrew/cask-drivers
sudo pacman -S qmk-toolbox

# tap and install jetbrains mono font
sudo pacman -S font-jetbrains-mono-nerd-font
