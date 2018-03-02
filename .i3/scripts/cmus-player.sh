#!/bin/bash
export XDG_RUNTIME_DIR='/tmp/1000-runtime-dir'
buttons() {
  case "$BLOCK_BUTTON" in
    1)
      # left click, choose song
      song="$(xargs -a ~/.config/cmus/lib.pl -d '\n' basename -s .mp3 | rofi -dmenu -i -no-fullscreen  -p "" -m -3 -no-custom -theme-str '#window {anchor:southeast; location: northwest;}' -width 40 -no-custom | grep -f -  ~/.config/cmus/lib.pl)"
      if [ ! -z "$song" ]; then
        cmus-remote -C "player-play $song"
        pkill -RTMIN+11 i3blocks
      fi
      ;;
    2)
      # middle click, stop
      cmus-remote --stop
      ;;
    3)
      # right click, pause song
      cmus-remote --pause
      ;;
    4)
      # scroll up, next song
      cmus-remote --next
      ;;
    5)
      # scroll down, previous song
      cmus-remote --prev
      ;;
    esac
}
buttons
data="$(cmus-remote -Q | sed -n "/^status/,/^file/s/status \(.*\)/\1/p; s/file \(.*\)/\1/p" | tr '\n' ' ')"
read status file <<< "$data"
file="$(basename "$file")"
file="${file%.mp3}"
file="${file//&}"

case "$status" in 
  "playing")
    status="♫"
    ;;
  "stopped")
    status="■"
    ;;
  "paused")
    status="⏸"
    ;;
esac

printf "%s %4.30s\n" "$status" "$file"
