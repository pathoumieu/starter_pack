#! /bin/bash

jupyter nbextension enable --py widgetsnbextension
set -e
pip3 install jupyter_contrib_nbextensions
set -e
~/.local/bin/jupyter contrib nbextension install --user
set -e
~/.local/bin/jupyter nbextension enable execute_time/ExecuteTime
