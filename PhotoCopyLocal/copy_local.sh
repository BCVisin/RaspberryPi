#!/bin/sh
#
#./copy_local.sh "/home/pi/Photos" "/home/pi/PhotoCopyLocal"

PHOTO_DIR_LOCATON=$1

DIR_LOCATION=$2
IMG_FILE_NAME='LOCAL.JPG'

SECONDS_IN_A_DAY=86400
SECONDS_NEXT_PHOTO=10
TMP_DIR="/run/shm/Photos"

mkdir $TMP_DIR

#copy a black image so we have something to start with
cp "$DIR_LOCATION/black.JPG" "$TMP_DIR/LOCAL2.JPG"

#export the display
export DISPLAY=:0
#run feh
feh --fullscreen --hide-pointer --auto-zoom --borderless --reload 5 --info "exifgrep '(DateTimeOriginal)' %F | cut -d \' -f 2-2 | sed -e 's/:/-/;s/:/-/' | xargs --null date +'%%B %%e, %%Y' -d" --font "$DIR_LOCATION/Ubuntu-L.ttf/40" "$TMP_DIR" &

while true
do

  find "$PHOTO_DIR_LOCATON" -iregex ".*\.\(jpg\|gif\|png\|jpeg\)" | sort --random-sort | head -$(($SECONDS_IN_A_DAY/$SECONDS_NEXT_PHOTO)) | while read photo
  do
    #copy the new file
    cp "$photo" "$TMP_DIR/$IMG_FILE_NAME"
    #switch the name
    if [ "$IMG_FILE_NAME" = "LOCAL.JPG" ] 
    then      
      IMG_FILE_NAME='LOCAL2.JPG'
    else
      IMG_FILE_NAME='LOCAL.JPG'
    fi
    sleep 1
    #remove the old file which will kill feh
    rm "$TMP_DIR/$IMG_FILE_NAME"
    #sleep 10 seconds
    sleep $((SECONDS_NEXT_PHOTO-1))
  done

done

