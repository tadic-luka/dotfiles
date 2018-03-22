#!/bin/bash
# if left click is pressed
if [ "$BLOCK_BUTTON" == "1" ]
then
	layout="$(find /usr/share/X11/xkb/symbols -maxdepth 1 -type f -printf "%f\n" | rofi -dmenu -i -no-fullscreen -p "" -m -3 -no-custom -lines 12 -no-fake-transparency -width 10 -theme-str '#window {anchor:southeast; location: northwest;}' -width 40)"
	if [ ! -z "$layout" ];
	then
		setxkbmap -layout "$layout"
	else
		layout=$(setxkbmap -query | grep layout | cut -d " " -f 6)
	fi
else
	layout=$(setxkbmap -query | grep layout | cut -d " " -f 6)
fi

echo $layout
