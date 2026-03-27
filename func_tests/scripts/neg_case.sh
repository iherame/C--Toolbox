#!/bin/bash

if [[ $# -ne 1 ]]; then
    exit 1
fi

if [[ ! -f $1 ]]; then
    exit 1
fi

if [[ ! -x ./app.exe ]]; then
    exit 1
fi

txt_in=$1
./app.exe < $txt_in
if [[ $? -ne 0 ]]; then
    exit 0
fi
exit 1

