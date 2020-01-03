#! /bin/bash

sudo apt-get install python3-pip
set -e
sudo pip3 install virtualenvwrapper
set -e
echo "export WORKON_HOME=$HOME/.virtualenvs">>~/.bashrc
echo "export PROJECT_HOME=$HOME/Devel">>~/.bashrc
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3">>~/.bashrc
echo "export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'">>~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh">>~/.bashrc
