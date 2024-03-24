#!/usr/bin/env zsh

# Install Brew Packages
sudo dnf install tree -y
sudo dnf install htop -y
sudo dnf install neovim -y
sudo dnf install tmux -y
sudo dnf install mosh -y
sudo dnf install fzf -y
sudo dnf install fd -y
sudo dnf install pngpaste -y
sudo dnf install spotify -y
sudo dnf install obsidian -y
sudo dnf install plex -y
sudo dnf install telegram -y
sudo dnf install trader-workstation -y
sudo dnf install iterm2 -y
sudo dnf install slack -y
sudo dnf install rectangle -y
sudo dnf install jesseduffield/lazygit/lazygit -y

brew tap homebrew/cask-drivers
sudo dnf install qmk-toolbox - y

# tap and install jetbrains mono font
sudo dnf install font-jetbrains-mono-nerd-font -y
