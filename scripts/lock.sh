#!/bin/sh

# This takes screenshot of current screen and passes it into betterlockscreen.
# When executing better lockscreen, ghetto DPI change takes place.
# DPI 300 is currently hardcoded into /usr/bin/betterlockscreen script.

if [ -e $tmp ]; then
  rm -rf $tmp
fi

tmp="/tmp/ss.png"                         # Screenshot file
blur_level=4                              # Blur amout
sep="      "                              # Dmenu separator
op1="$sep Cancel"                         # Options 1 and 2...
op2="$sep Lock Screen"

# Fullscreen screenshot
shotgun -f png $tmp
convert $tmp -resize 1280x720 $tmp

opt=$(echo -e "$op1\n$op2" | dmenu -p "What do you want to do?")

lock () {
  dunstify -i desktop_windows -t 1000 "Locking X ..." "This may take few seconds"

  betterlockscreen -u $tmp -b $blur_level
  
  if [ "$1" = "spn" ]; then
    betterlockscreen -s dimblur
  else
    betterlockscreen -l dimblur
  fi
}

case $opt in
$op1)
  exit 0
  ;;
$op2)
  lock
  ;;
esac
