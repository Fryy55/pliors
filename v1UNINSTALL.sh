#!/bin/bash

end_dir=$HOME/.vzlom
cron_job='* * * * * ~/.vzlom/.vzlom.sh'

if [ -d $end_dir ]; then
    echo 'Uninstalling v1...'
    rm -r $end_dir

    crontab -l 2>/dev/null | grep -v "$cron_job" | crontab - &>/dev/null

    if [[ -z $(crontab -l) ]]; then
        crontab -r &>/dev/null
    fi

    echo 'Done.'
    exit 0
else
    echo 'v1 is already uninstalled.'
fi
