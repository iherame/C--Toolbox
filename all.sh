#!/bin/bash
if [[ ! -f main.c ]]; then
    exit 1
fi


./clean.sh


./build_debug.sh || exit 1
./func_tests/scripts/func_tests.sh || exit 1
./clean.sh

./build_debug_asan.sh || exit 1
./func_tests/scripts/func_tests.sh || exit 1
./clean.sh

./build_debug_msan.sh || exit 1
./func_tests/scripts/func_tests.sh || exit 1
./clean.sh

./build_debug_ubsan.sh || exit 1
./func_tests/scripts/func_tests.sh || exit 1
./clean.sh

./build_release.sh || exit 1
./func_tests/scripts/func_tests.sh || exit 1
./clean.sh

./collect_coverage.sh || exit 1
./func_tests/scripts/func_tests.sh || exit 1
./clean.sh
