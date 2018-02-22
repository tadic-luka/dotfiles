#!/bin/bash
input="$(echo "!yt " | dmenu -p "Search: ")"
case "$input" in
  !yt\ *) 
    bash /home/luka/Skripte/production/search.sh "${input#*yt }"
    ;;
  *)
    echo "nije"
    ;;
esac
