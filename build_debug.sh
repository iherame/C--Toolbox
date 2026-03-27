#!/bin/bash
if [[ -f "main.c" ]]; then
  gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -g -c "main.c" -o "main.o"
  gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -g  "main.o" -o "app.exe" -lm
else 
  exit 1
fi
