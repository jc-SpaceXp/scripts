#!/bin/bash

usb_dir="$1"
echo "copying to $usb_dir"
for i in *.m3u; do
    [ -f "$i" ] || break
	copy_count=0
	all_lines=$(wc -l < "$i")
	echo "Copying playlist $i"
	# read input line by line
	while read y
	do
		src=$(echo "$y")
		dest=$(echo "$src" | sed "s|$HOME/Music|$usb_dir|")
		mkdir -p "$(dirname "${dest}")" && rsync -tvpgoD "$src" "$dest"

		copy_count=$((++copy_count))
		echo "Copying file $copy_count of $all_lines"
	done < "$i"
done
