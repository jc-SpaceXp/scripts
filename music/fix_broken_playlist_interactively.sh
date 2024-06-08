#!/bin/bash

file="FIXED_$1"
dir=$(pwd)
outfile="$dir/$file"

# launch fzf from ~ for absolute path in playlist
pushd -n ~ 1> /dev/null
while IFS= read -r line
do
	x=$(find "$line" 2> /dev/null)
	res=$?
	if [ $res -eq 1 ]; then
		pushd +1 1> /dev/null
		find * -type f | fzf -i -q"${line##*/}" | sed -e "s|^|$HOME/|;" >> $outfile
		# ensure we always go back to cwd so we can get back to ~ again
		pushd +1 1> /dev/null
	else
		echo "$line" >> $outfile
	fi
done < "$1"
popd +1 1> /dev/null
