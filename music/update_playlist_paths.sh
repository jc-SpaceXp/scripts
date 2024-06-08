#!/bin/bash
playlist_files=$(find . -type f -name "*.m3u")

og_stem="$HOME/Music/"
new_stem="../"
playlist_dir="Playlists"

shopt -s globstar
for playlist in **/*.m3u
do
	sed -i "s|$og_stem|$new_stem|g" "$playlist"
done
