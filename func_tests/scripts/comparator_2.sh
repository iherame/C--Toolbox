#!/bin/bash

if [[ "$#" -ne 2 ]]; then
  exit 1
fi

FILE1="$1"
FILE2="$2"

if [[ ! -f "$FILE1" ]]; then
  exit 2
fi

if [[ ! -f "$FILE2" ]]; then
  exit 3
fi

CONTENT1=$(cat "$FILE1")
CONTENT2=$(cat "$FILE2")

PART1="${CONTENT1#*Result: }"
PART2="${CONTENT2#*Result: }"

if [[ -z "$PART1" ]]; then
  exit 4
fi

if [[ -z "$PART2" ]]; then
  exit 5
fi

TMP1="comparator_2_part_1_$$.tmp"
TMP2="comparator_2_part_2_$$.tmp"

printf '%s' "$PART1" > "$TMP1" || exit 6
printf '%s' "$PART2" > "$TMP2" || exit 7

if diff -q "$TMP1" "$TMP2" >/dev/null 2>&1; then
  rm -f "$TMP1"
  rm -f "$TMP2"
  exit 0
else
  rm -f "$TMP1"
  rm -f "$TMP2"
  exit 10
fi