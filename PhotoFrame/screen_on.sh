#!/bin/sh
#
# Script to turn off display

# Set display so that script will effect screen on frame
export DISPLAY=:0

/usr/bin/tvservice -p
/usr/bin/xset s reset
/usr/bin/xset s off

exit 0
