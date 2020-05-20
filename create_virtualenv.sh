#! /bin/bash

## Example
## ./create_virtualenv.sh -d ./ -n sandbox -r requirements.txt

has_requirements='false'

while getopts "d:r:n:" OPTION
do
	case $OPTION in
		d)
            dir=$OPTARG
            ;;
        r)
            has_requirements='true'
            requirements=$OPTARG
            ;;
		n)
            name=$OPTARG
            ;;
		\?)
            echo "Error: please enter valid flag argument."
			exit
            ;;
	esac
done

source `which virtualenvwrapper.sh`
if $has_requirements; then
    mkvirtualenv -a $dir -p python3 -r $requirements $name
else
    mkvirtualenv -a $dir -p python3 $name
fi
set -e

workon $name
pip install jupyter --quiet
set -e
pip install ipykernel --quiet
set -e
python -m ipykernel install --user --name $name
set -e
deactivate
set -e
