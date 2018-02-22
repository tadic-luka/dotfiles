#!/bin/bash
export XDG_RUNTIME_DIR='/tmp/1000-runtime-dir'
song="$(xargs -a ~/.config/cmus/lib.pl -d '\n' basename -s .mp3  | rofi -dmenu  -i -p ""  | grep -f - ~/.config/cmus/lib.pl)"
if [ ! -z "$song" ]; then
  cmus-remote -C "player-play $song"
  pkill -RTMIN+11 i3blocks
fi
