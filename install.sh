#!/usr/bin/env zsh
pushd $DOTFILES

echo "Creating symlinks to dotfiles"

for folder in $(echo $STOW_FOLDERS | sed "y/,/ /")
do
    echo "stow $folder"
    stow -D $folder
    stow $folder
done

echo "Dotfile symlinks created!"

popd
