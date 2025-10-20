#!/bin/bash

end_dir=$HOME/.vzlom
cron_job='* * * * * ~/.vzlom/.vzlom.sh'

if [ -d $end_dir ]; then
    echo 'Script is set up already, uninstalling.'
    rm -r $end_dir

    crontab -l 2>/dev/null | grep -v "$cron_job" | crontab - &>/dev/null

    if [[ -z $(crontab -l) ]]; then
        crontab -r &>/dev/null
    fi

    echo 'Done.'
    exit 0
fi

while true; do
    read -p 'Port: ' port

    if [[ $port =~ ^[[:digit:]]{1,5}$ && $port -gt 1023 && $port -lt 65536 ]]; then
        break
    fi
done

pwd="$(dirname "$(readlink -f "$0")")"

mkdir $end_dir
cp $pwd/vzlom.sh $end_dir/.vzlom.sh
echo $port > $end_dir/.port


tmp_file=$(mktemp)
crontab -l > $tmp_file 2>/dev/null

echo "$cron_job" >> $tmp_file
cat $tmp_file | crontab - &>/dev/null

rm $tmp_file

echo 'Done.'
