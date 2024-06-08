#!/bin/bash

usb_dir="$1"
flac_files=$(find $usb_dir -type f -name '*.flac')

# process each file individually and remove after successful conversion
while IFS= read -r file
do
	ffmpeg -nostdin -i "${file}" -write_id3v2 1 -c:v copy "${file%.*}".aiff \
    && rm "$file"
done <<< "$flac_files"

# list any flac files left behind
flac_files=$(find $usb_dir -type f -name '*.flac')
if [ -n "$flac_files" ]; then
	echo "$flac_files" > $usb_dir/flac_files.txt
fi
