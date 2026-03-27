#!/bin/bash
if [[ -f "main.c" ]]; then
  gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion -c "main.c" -o "main.o" -lm
  gcc -std=c99 -Wall -Werror -Wpedantic -Wextra -Wfloat-equal -Wfloat-conversion  "main.o" -o "app.exe" -lm
else 
  exit 1
fi

# попровить builderы

