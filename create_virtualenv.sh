#! /bin/bash

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
workon $name
pip install jupyter --quiet
pip install ipykernel --quiet
python -m ipykernel install --user --name $name
deactivate
jupyter notebook
