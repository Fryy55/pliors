#!/bin/bash

pwd="$(dirname "$(readlink -f "$0")")"
source "$pwd/.utils.sh"

if [ -d $end_dir ]; then
    echo 'Uninstalling...'
    port=$(cat $end_dir/.port)

    rm -r $end_dir

    crontab -l 2>/dev/null | grep -v "$cron_job" | crontab - &>/dev/null

    if [[ -z $(crontab -l) ]]; then
        crontab -r &>/dev/null
    fi

    remove_port $port

    echo 'Done.'
    exit 0
else
    echo "PLIoRS isn't installed."
fi
