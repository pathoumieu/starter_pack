#! /bin/bash

sudo apt-get install htop
sudo apt-get install vim
sudo apt-get install terminator
sudo apt install openssh-server
sudo apt-get install net-tools
sudo apt-get install git
sudo apt-get install gitk

sudo snap install slack
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo snap install --classic code

cp .bash_aliases ~/
source ~/.bash_aliases
cp .gitconfig ~/

ssh-keygen -b 2048 -t rsa
