#! /bin/bash

rmvirtualenv $1
set -e
jupyter kernelspec remove $1
