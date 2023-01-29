#!/usr/bin/env zsh

# Install Brew Packages
brew install pyenv
brew install tree
brew install htop
brew install neovim
brew install tmux
brew install mosh
brew install alacritty
brew install fzf
$(brew --prefix)/opt/fzf/install

# Install MacOS Applications
brew install --cask firefox
brew install --cask spotify
brew install --cask obsidian
brew install --cask plex
brew install --cask telegram
brew install --cask trader-workstation
brew install --cask iterm2
brew install jesseduffield/lazygit/lazygit

brew tap homebrew/cask-drivers
brew install --cask qmk-toolbox

# tap and install jetbrains mono font
brew tap homebrew/cask-fonts &&
brew install --cask font-jetbrains-mono-nerd-font
