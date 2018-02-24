#!/bin/bash
input="$(echo -e "!yt \n!pl " | dmenu)"
case "$input" in
  !yt\ *) 
    bash /home/luka/Skripte/production/searchv2.sh "${input#*yt }" video
    ;;
  !pl\ *) 
    bash /home/luka/Skripte/production/searchv2.sh "${input#*pl }" playlist
    ;;
  *)
    echo "nije"
    ;;
esac
