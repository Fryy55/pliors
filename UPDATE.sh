#!/bin/bash

pwd="$(dirname "$(readlink -f "$0")")"
source "$pwd/.utils.sh"

echo 'Updating `.pliors.sh`...'
cp $pwd/.pliors.sh $end_dir/.pliors.sh

echo 'Done.'
