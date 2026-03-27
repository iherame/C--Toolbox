#!/bin/bash

if [[ $# -ne 2 ]]; then
    exit 1
fi

if [[ ! -f $1 || ! -f $2 ]]; then
    exit 1
fi

txt_1=$1
txt_2=$2

grep -oE [-+]?[0-9]+\.?[0-9]+ $txt_1 > temp_1
grep -oE [-+]?[0-9]+\.?[0-9]+ $txt_2 > temp_2
diff  temp_1 temp_2 >/dev/null
code_exit="$?"
rm -f temp_1
rm -f temp_2
exit $code_exit