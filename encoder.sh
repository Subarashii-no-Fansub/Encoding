#!/bin/sh
# paramètre 1 : video $1
# paramètre 2 : .ass $2
# paramètre 3 : nom du fichier de sorti

set -e

file="$3_first.mkv"
file_end="$3.mkv"

chmod 644 "$1"
mkvmerge -o "$file"  --default-track 0:yes --forced-track 0:no --language 1:jpn --default-track 1:yes --forced-track 1:no --audio-tracks 1 --video-tracks 0 --no-subtitles --no-track-tags --no-global-tags "$1" --forced-track 0:no --subtitle-tracks 0 --no-video --no-audio --no-track-tags --no-global-tags --no-chapters "$2"

chmod 644 "$file"
mkvmerge -o "$file_end" --default-track 0:yes --forced-track 0:no --language 1:jpn --default-track 1:yes --forced-track 1:no --language 2:fre --track-name 2:"Subarashii no Fansub" --default-track 2:yes --forced-track 2:no --audio-tracks 1 --video-tracks 0 --subtitle-tracks 2  --no-track-tags --no-global-tags "$file"
chmod 644 "$file_end"
rm "$file"

echo "Le CRC de ce fichier est : " && crc32 "$file_end"
