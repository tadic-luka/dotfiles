#!/bin/bash

while [ $# -ge 2 ];
do
	#echo "$1, $2" >> /home/luka/cmus.log
	eval _$1='$2'
	shift
	shift
done

if [  -n "$_file" ];
then
	pkill -RTMIN+11 i3blocks
fi
	

