#!/bin/sh
#
#run feh with the provided photo and directory location

IMG_FILE_NAME=$1
#--font "Ubuntu-B.ttf/20"
feh --fullscreen --hide-pointer --auto-zoom --borderless --reload 1 --info "exifgrep '(DateTimeOriginal)' %F | cut -d \' -f 2-2 | sed -e 's/:/-/;s/:/-/' | xargs --null date +'%%B %%e, %%Y' -d" --font "Ubuntu-L.ttf/40" "$IMG_FILE_NAME"
