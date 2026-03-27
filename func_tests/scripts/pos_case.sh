#!/bin/bash

if [[ $# -ne 2 ]]; then
    exit 1
fi

if [[ ! -f $1 || ! -f $2 ]]; then
    exit 1
fi

if [[ ! -x ./app.exe ]]; then
    exit 1
fi

txt_in=$1
txt_out=$2

./app.exe < $txt_in > res
./func_tests/scripts/comparator.sh res $txt_out

if [[ $? -eq 0 ]]; then
    rm -f res
    exit 0
fi
rm -f res
exit 1
