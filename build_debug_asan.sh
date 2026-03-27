#!/bin/bash
if [[ -f "main.c" ]]; then
  clang -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -g -fsanitize=address -c -fno-omit-frame-pointer "main.c" -o "main.o" 
  clang -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -g -fsanitize=address  -fno-omit-frame-pointer "main.o" -o "app.exe" -lm
else 
  exit 1
fi
