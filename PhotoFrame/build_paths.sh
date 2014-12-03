#!/bin/sh
#create image_path file in random access order

IMGFNAME=~/PhotoFrame/image_paths.txt

find /media/networkshare/photos/Eye-Fi/ -iregex ".*\.\(jpg\|gif\|png\|jpeg\)" | sort --random-sort | head -500 > $IMGFNAME
