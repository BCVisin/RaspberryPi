#!/bin/sh
#
# Script to run Digital Picture Frame using Feh

export DISPLAY=:0
IMGFNAME=~/PhotoFrame/image_paths.txt

# Change number below to the duration, in seconds
# for each photo to be displayed
DELAY="10"

# Start slide show
/usr/bin/qiv --shuffle --fullscreen --delay $DELAY --autorotate --scale_down --maxpect --readonly --slide --no_statusbar --disable_grab --file $IMGFNAME &
