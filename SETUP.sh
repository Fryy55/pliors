#!/bin/bash

pwd="$(dirname "$(readlink -f "$0")")"
source "$pwd/.utils.sh"

touch "$pwd/ports.txt"


if [ -d $end_dir ]; then
    echo 'Script is set up already. You can update the port/name from here.'

    new_port=$(get_port)
    new_name=$(get_name)

    # cleanup
    remove_port $(cat "$end_dir/.port")

    # set the new port
    echo $new_port > "$end_dir/.port"
    add_port $new_port $new_name

    echo 'Updated.'
    exit 0
fi

# input
port=$(get_port)
name=$(get_name)

# end dir creation
mkdir $end_dir
cp $pwd/.pliors.sh $end_dir/.pliors.sh
echo $port > $end_dir/.port


tmp_file=$(mktemp)
crontab -l > $tmp_file 2>/dev/null

echo "$cron_job" >> $tmp_file
cat $tmp_file | crontab - &>/dev/null

rm $tmp_file

# save the port
add_port $port $name

echo 'Done.'
