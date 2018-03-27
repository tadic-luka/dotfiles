export XDG_RUNTIME_DIR='/tmp/1000-runtime-dir'

print_list() {
	cmus-remote -C 'save -l -' | xargs -d '\n' basename -s .mp3
}

if [ $# -eq 0 ]; then
	# started
	print_list
else
	# song picked, run it
	cmus-remote <<- EOF
	/$1
	win-activate
	EOF
	pkill -RTMIN+11 i3blocks
fi
