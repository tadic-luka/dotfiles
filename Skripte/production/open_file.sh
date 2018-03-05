#!/bin/bash
file="$((git ls-tree -r --name-only HEAD   || fd -t f) | rofi -dmenu)"
echo "file je $file"
if [ ! -z "$file" ]; then
  st -e vim "$file"
fi
