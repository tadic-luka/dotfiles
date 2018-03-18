export XDG_RUNTIME_DIR='/tmp/1000-runtime-dir'

print_list() {

	xargs -a ~/.config/cmus/lib.pl -d '\n' basename -s .mp3  
}

find_song() {
	grep  "$1" ~/.config/cmus/lib.pl
}
if [ $# -eq 0 ]; then
	# started
	print_list
else
	song="$(find_song "$1")"
	echo "song je $song" > rofi.log
	cmus-remote -C "player-play $song"
	pkill -RTMIN+11 i3blocks
fi
