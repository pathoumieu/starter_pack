#! /bin/bash

jupyter nbextension enable --py widgetsnbextension
set -e
pip3 install jupyter_contrib_nbextensions
set -e
jupyter contrib nbextension install --user
set -e
jupyter nbextension enable execute_time/ExecuteTime
