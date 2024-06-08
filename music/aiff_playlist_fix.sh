#!/bin/bash
usb_dir="$1"
playlist_dir="Playlists"
playlist_files=$(find $usb_dir/$playlist_dir -maxdepth 1 -type f -name '*.m3u')

while IFS= read -r playlist
do
	sed -i 's/.flac/.aiff/g' "$playlist"
done <<< "$playlist_files"
