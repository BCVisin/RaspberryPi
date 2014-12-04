#!/bin/sh
#
#./copy_local.sh "/home/pi/Photos" "/home/pi/PhotoCopyLocal"

PHOTO_DIR_LOCATON=$1

DIR_LOCATION=$2
IMG_FILE_NAME='LOCAL.JPG'

SECONDS_IN_A_DAY=86400
SECONDS_NEXT_PHOTO=10

while true
do

  find "$PHOTO_DIR_LOCATON" -iregex ".*\.\(jpg\|gif\|png\|jpeg\)" | sort --random-sort | head -$(($SECONDS_IN_A_DAY/$SECONDS_NEXT_PHOTO)) | while read photo
  do
    #copy the new file
    cp "$photo" "$DIR_LOCATION/$IMG_FILE_NAME"

    #run feh on the local file
    $DIR_LOCATION/run_feh.sh "$DIR_LOCATION/$IMG_FILE_NAME" &

    #switch the name
    if [ "$IMG_FILE_NAME" = "LOCAL.JPG" ] 
    then      
      IMG_FILE_NAME='LOCAL2.JPG'
    else
      IMG_FILE_NAME='LOCAL.JPG'
    fi
    sleep 1
    #remove the old file which will kill feh
    rm "$DIR_LOCATION/$IMG_FILE_NAME"
    #sleep 10 seconds
    sleep $((SECONDS_NEXT_PHOTO-1))
  done

done

