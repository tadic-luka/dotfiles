export XDG_RUNTIME_DIR='/tmp/user/1000'
print_list() {
	cmus-remote -C 'save -l -' | xargs -d '\n' basename -s .mp3

}
if [ $# -gt 0 ]; then
	cmus-remote <<- EOF
	view 2
	/$1
	win-add-q
	EOF
fi
print_list
