#!/bin/bash

while [ $# -ge 2 ];
do
	eval _$1='$2'
	shift
	shift
done

if [  -n "$_file" ];
then
	#gdbus call --session --dest org.mpris.MediaPlayer2.cmus \
		#--object-path /org/mpris/MediaPlayer2 \
		#--method org.mpris.MediaPlayer2.Player.QueryPlayer


	pkill -RTMIN+11 i3blocks
fi
	

