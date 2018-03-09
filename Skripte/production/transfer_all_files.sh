#!/bin/bash

print_usage() {
  echo "Usage: transfer_all_files <option> <command> [<arg>...]"
  echo
  echo "Commands:"
  printf " %-15s  %-s\n" "print" "Print all files newer than last date update."
  printf " %-15s  %-s\n" "push_to_phone" "Push all files newer than last date update to android phone via adb push."
  printf " %-15s  %-s\n" "kdeconnect" "Push all files newer than last date update to android phone via kdeconnect."
  echo 
  echo "Options:"
  printf "   %s\n" "-d<dir>, --dir=<dir>"
  printf "      Dir from where files will be listed.\n"
  printf "   %s\n" "-h, --help"
  printf "      Print this message and exit\n"
  echo ""
  echo "Args:"
  printf " %8s %s\n" "push_to_phone" "<output_path>"
  printf " %8s %s\n" "kdeconnect" "<phone_name>"
}


comm=""
while [ "$#" -gt 0 ]; do
  case "$1" in
    -h|--help)
      print_usage
      exit 0
      ;;
    -d|--dir)
      music_dir="$2"
      shift 2
      ;;
    print)
      comm="echo \"\$line\""
      shift  
      ;;
    push_to_phone)
      if [ -z "$2" ]; then
        echo 'Please specify path to storage.'
        print_usage
        exit 1
      fi
      comm="adb push \"\$line\" $2; sleep 1"
      shift 2
      ;;
    kdeconnect)
      if [ -z "$2" ]; then
        echo 'Please specify phone to connect with kdeconnect'
        exit 1
      fi
      comm="kdeconnect-cli --share \"\$line\" -n $2;sleep 5"
      shift 2
      ;;
  esac
done

if [ -z "$comm" ]; then
  echo "Please specify command"
  print_usage
  exit 1
fi

if [ ! -d "$music_dir" ]; then
  echo "Argument must be dir";
  print_usage
  exit 1;
fi

last_mod="$(sqlite3 ~/.cache/music_transfer/transfer.db 'select last_mod from transfer where id = 1;')"
find "$music_dir" -type f -newermt "$last_mod" | while read -r line; do
  eval "$comm"
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

