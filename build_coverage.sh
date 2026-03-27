#!/bin/bash
if [[ -f "main.c" ]]; then
  gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -c --coverage "main.c" -o "main.o"
  gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion --coverage "main.o" -o "app.exe" -lm
else 
  exit 1
fi

# попровить builderы
