#! /bin/bash

sudo apt-get install python3-pip

sudo pip3 install virtualenvwrapper

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
source /usr/local/bin/virtualenvwrapper.sh