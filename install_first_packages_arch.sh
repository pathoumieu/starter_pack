#! /bin/bash

sudo pacman -S firefox gedit libreoffice htop vim terminator gitk meld

cp .bash_aliases ~/
source ~/.bash_aliases
cp .gitconfig ~/
echo "export source ~/.bash_aliases">>~/.bashrc
