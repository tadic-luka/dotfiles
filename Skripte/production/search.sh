#!/bin/zsh
search() {
 python3 - <<DOC
from apiclient.discovery import build
import sys
import json
DEVELOPER_KEY = "AIzaSyCPNnQcy4HiTfGnhlhZmneAYugR_Q4P2yc"
YOUTUBE_API_SERVICE_NAME = "youtube"
YOUTUBE_API_VERSION = "v3"
YOUTUBE_WATCH_URL = "https://youtube.com/watch?v="

youtube = build(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION, developerKey=DEVELOPER_KEY)

response = youtube.search().list(
        q="$1",
        part='id,snippet',
        maxResults=25
        ).execute()
# response = json.dumps(response, sort_keys=True, indent=4)
search_response = list(
        filter(
            lambda x: x['id']['kind'] == 'youtube#video',
            response.get('items', [])
        )
)

result = list(
        map(
            lambda x:
            {
                'title': x['snippet']['title'],
                'url': YOUTUBE_WATCH_URL + x['id']['videoId'],
                'thumbnail': x['snippet']['thumbnails']['high']['url']
            },
            search_response
        )
)

for res in result:
    print(res['title'])
    print(res['url'])
    print(res['thumbnail'])
DOC
}
yt() {
  dirname="$1"
  search="$2"
  search "$search" | while {
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
  while read -r input; do
    read -r url < "$1"/"$input"-url
    rm -rf "$1"
    printf '%s\n' "$url"
  done
}

tmp="$(mktemp -d /tmp/"$1"XXX)"
url="$(yt "$tmp" "$1" | handle "$tmp")"
if [ ! -z "$url" ]; then
  echo "url je $url"
  mpv --fs "$url"
fi
