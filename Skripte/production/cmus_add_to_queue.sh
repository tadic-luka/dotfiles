export XDG_RUNTIME_DIR='/tmp/1000-runtime-dir'
print_list() {
	xargs -a ~/.config/cmus/lib.pl -d '\n' basename -s .mp3  
}

find_song() {
	grep  "$1" ~/.config/cmus/lib.pl
}
if [ $# -gt 0 ]; then
	song="$(find_song "$1")"
	cmus-remote -C "add -q $song"
fi
print_list
