#!/bin/bash

pwd="$(dirname "$(readlink -f "$0")")"
source "$pwd/.utils.sh"

if [ -d $end_dir ]; then
    echo 'Updating `.pliors.sh`...'
    cp $pwd/.pliors.sh $end_dir/.pliors.sh

    echo 'Done.'
else
    echo "PLIoRS isn't installed."
fi
