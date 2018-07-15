#!/bin/zsh
search() {
  python3 /home/luka/Documents/Python/youtube_search/main.py "$1" "$2"
}
yt() {
  search_type="$1"
  dirname="$2"
  search_query="$3"
  search  "$search_type" "$search_query" | while {
  read -r title
  read -r url
  read -r image
  } do
    title="${title%%/*}"
    curl -s "$image" -o "$dirname"/"$title" &
    printf "%s\n" "$url" > "$dirname"/"$title"-url
    printf 'IMG:%s\t%s\n' "$dirname"/"$title" "$title"
  done | dmenu -p "Select video: " -is 480x360 -l 11
}
handle() {
  read -r input
  read -r url <"$1"/"$input"-url
  rm -rf "$1"
  printf '%s\n' "$url"
}

tmp="$(mktemp -d /tmp/"$1"XXX)"
url="$(yt "$2" "$tmp" "$1" | handle "$tmp")"
if [ ! -z "$url" ]; then
  mpv --fs "$url"
fi
