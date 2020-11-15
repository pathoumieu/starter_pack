# Description

This repository contains various scripts useful for Ubuntu/Arch Linux installation and set up.


# Notes

Before executing `sh` scripts, make sure the files are executable running `chmod a+x [script_name]`


# Virtualenvwrapper script for Python

`./create_virtualenv.sh` allows to create a Python virtualenv with virtualenvwrapper, automatically install dependencies and create
a jupyter kernel for the venv.

To use virtualenwrapper easy script, install and set up virtualenwrapper running `./virtualenwrapper.sh`.

Once virtualenvwrapper is installed, running `./create_virtualenv.sh -d ./ -n sandbox -r requirements.txt` will create a virtualenv in the current directory (`./`)
named `sandbox`, will install dependencies listed in the specified `requirements.txt` file (the file has to be located in the specified directory),
as well as installing jupyter and linking the virtualenv to a jupyter kernel named `sandbox`.

* replace the `./` value of argument `-d` by the directory you want to create the venv in
* replace the `sandbox` value of argument `-n` argument by the name you want to give your venv
* replace `requirements.txt` the value of argument `-r` your file containing python dependencies (located in the directory you specified after `-d`)