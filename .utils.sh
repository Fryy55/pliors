#!/bin/bash

pwd="$(dirname "$(readlink -f "$0")")"

end_dir=$HOME/.local/share/pliors
cron_job='* * * * * ~/.local/share/pliors/.pliors.sh'


add_port() {
    echo "$1 $2" >> "$pwd/ports.txt"

    return
}

remove_port() {
    grep -v "^$1 " "$pwd/ports.txt" > "$pwd/~ports.txt"
    mv "$pwd/~ports.txt" "$pwd/ports.txt"

    return
}


# input
get_port() {
    while true; do
        read -p 'Port: ' port

        if [[ $port =~ ^[[:digit:]]{1,5}$ && $port -gt 1023 && $port -lt 65536 ]]; then
            break
        fi
    done

    echo $port
}

get_name() {
    while true; do
        read -p 'Name: ' name

        if [[ $name =~ ^[[:alnum:]_]+$ ]]; then
            break
        fi
    done

    echo "$name"
}
