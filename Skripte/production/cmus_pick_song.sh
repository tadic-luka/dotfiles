export XDG_RUNTIME_DIR='/tmp/user/1000'

print_list() {
	cmus-remote -C 'save -l -' | xargs -d '\n' basename -s .mp3
}

if [ $# -eq 0 ]; then
	# started
	print_list
else
	# song picked, run it
	cmus-remote <<- EOF
	view 2
	/$1
	win-activate
	EOF
	pkill -RTMIN+11 i3blocks
fi
