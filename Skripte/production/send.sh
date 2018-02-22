#!/bin/bash
song="$(xargs -a ~/.config/cmus/lib.pl -d '\n' basename -s .mp3  | rofi -dmenu  -i -p "" -multi-select  | grep -f - ~/.config/cmus/lib.pl)"
if [ ! -z "$song" ]; then
  while read -r line; do
    echo "$line"
  done <<< "$song"
fi
