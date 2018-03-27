export XDG_RUNTIME_DIR='/tmp/1000-runtime-dir'
print_list() {
	cmus-remote -C 'save -l -' | xargs -d '\n' basename -s .mp3

}
if [ $# -gt 0 ]; then
	cmus-remote <<- EOF
	/$1
	win-add-q
	EOF
fi
print_list
