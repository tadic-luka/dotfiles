#!/bin/bash

#/opt/usr/local/bin/twmnc "$@"
#notify-send "$*" pet
while [ $# -ge 2 ];
do
	eval _$1='$2'
	shift
	shift
done

if [  -n "$_file" ];
then
	pkill -RTMIN+11 i3blocks
	# id3tag-notify "$_file"
fi
	

