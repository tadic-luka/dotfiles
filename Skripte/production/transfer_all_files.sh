#!/bin/bash

music_dir=$1
phone_name="$2"

if [ ! -d "$music_dir" ]; then
  echo "Argument must be dir";
  exit 1;
fi

last_mod="$(sqlite3 ~/.cache/music_transfer/transfer.db 'select last_mod from transfer where id = 1;')"
find "$music_dir" -type f -newermt "$last_mod" | while read -r line; do
  #echo "$line";
  adb push "$line" '/storage/sdcard1/Music/'
  #kdeconnect-cli --share "$line" -n "$phone_name"
  sleep 1
done

read -p "Set new date for reference? yn: " -n 1 -r
echo ""
case $REPLY in 
  [Yy])
      sqlite3 ~/.cache/music_transfer/transfer.db "update transfer set last_mod = datetime('now', 'localtime') where id = 1;"
      echo "Date updated!"
      ;;
  *)
    echo "Date not updated!"
    ;;
esac

