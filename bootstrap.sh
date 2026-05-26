#!/bin/sh

set -e # Any subsequent(*) commands which fail will cause the shell script to exit immediately

# make links
mkdir -p ~/.config/fish

ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
ln -sf ~/dotfiles/.config/fish/functions ~/.config/fish/
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global

echo "Successfully updated dotfiles!"
