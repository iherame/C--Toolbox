#!/bin/bash

if [[ ! -f "main.c" ]]; then
    exit 1
fi
./clean.sh
./build_coverage.sh
./func_tests/scripts/func_tests.sh || exit 1
gcov main.c
rm -f *.gcda
rm -f *.gcno