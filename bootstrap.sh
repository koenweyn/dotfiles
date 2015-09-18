#!/bin/sh

set -e # Any subsequent(*) commands which fail will cause the shell script to exit immediately

# make links
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile

#load bash_profile
. ~/.bash_profile

echo "Successfully updated dotfiles!"

