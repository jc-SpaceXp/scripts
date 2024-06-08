#!/bin/bash
usb_dir="$1"
playlist_dir="Playlists"
playlist_files=$(find $usb_dir/$playlist_dir -maxdepth 1 -type f -name '*.m3u')

og_stem="$HOME/Music/"
new_stem="../"

while IFS= read -r playlist
do
	sed -i "s|$og_stem|$new_stem|g" "$playlist"
done <<< "$playlist_files"
