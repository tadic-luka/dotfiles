#!/bin/bash
IMAGE=/tmp/i3lock.png
ICON=/home/luka/Pictures/Icons/lock.png
SCREENSHOT="scrot $IMAGE"

# BLURTYPE="0x5" # 7.52s
BLURTYPE="0x2" # 4.39s
# BLURTYPE="5x2" # 3.80s
# BLURTYPE="2x8" # 2.90s
# BLURTYPE="2x3" # 2.92s

$SCREENSHOT
#convert $IMAGE -resize 50%
#convert $IMAGE -blur $BLURTYPE $IMAGE
#convert $IMAGE -resize 200%
convert $IMAGE -scale 10% -scale 1000% $IMAGE
convert $IMAGE $ICON -gravity center -composite -matte $IMAGE
i3lock -u -i $IMAGE
