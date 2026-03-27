#!/bin/bash

total=0
passed=0
failed=0

find func_tests/data/ -type f -name "pos*in.txt" > temp
for test_in in $(cat temp); do
    total=$((total+1))
    test_out=${test_in/in/out}
    ./func_tests/scripts/pos_case.sh "$test_in" "$test_out"
    if [[ $? -eq 0 ]]; then
        passed=$((passed+1))
    else
        failed=$((failed+1))
        echo "$test_in"
    fi
done

rm -f temp
find func_tests/data/ -type f -name "neg*in.txt" > temp
for test_in in $(cat temp); do
    total=$((total+1))
    ./func_tests/scripts/neg_case.sh "$test_in"
    if [[ $? -eq 0 ]]; then
        passed=$((passed+1))
    else
        failed=$((failed+1))
        echo "$test_in"
    fi
done
rm -f temp

echo "$passed/$total passd"
exit "$failed"