#! /bin/bash

rmvirtualenv $1
jupyter kernelspec remove $1
