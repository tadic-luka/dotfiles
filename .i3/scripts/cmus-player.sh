#!/bin/bash
export XDG_RUNTIME_DIR='/tmp/user/1000'
buttons() {
  case "$BLOCK_BUTTON" in
    1)
      # left click, choose song
      song="$(cmus-remote -C 'save -l -' | xargs -d '\n' basename -s .mp3 | rofi -dmenu \
	      -i -no-fullscreen  -p "" -m -3 -theme-str '#window {anchor:southeast; location: northwest;}' \
	      -fake-transparency -width 35 -no-custom)"
      if [ ! -z "$song" ]; then
        cmus-remote <<- EOF
	view 2
	/$song
	win-activate
	EOF
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
data="$(cmus-remote -C 'format_print %{status}^%F')"
title="${data#*^}"
title="${title%.mp3}"
status="${data%^*}"
case "$status" in 
  ">")
    status="♫"
    ;;
  ".")
    status="■"
    ;;
  "|")
    status="⏸"
    ;;
esac
printf "%s %4.30s\n" "$status" "$title" | sed 's/&/\&amp;/g; s/</\&lt;/g' | iconv -t UTF-8
