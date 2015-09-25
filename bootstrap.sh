#!/bin/sh

set -e # Any subsequent(*) commands which fail will cause the shell script to exit immediately

# make links
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish

-sf ~/dotfiles/IntelliJ/liveTemplates/* ~/Library/Preferences/IntelliJIdea14/templates/

echo "Successfully updated dotfiles!"
