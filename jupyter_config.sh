#! /bin/bash

jupyter nbextension enable --py widgetsnbextension
pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
jupyter nbextension enable execute_time/ExecuteTime
