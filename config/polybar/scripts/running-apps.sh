#!/bin/sh
separator="    "
interval=5

app () {
  # $1 app name
  # $2 icon
  
  pidof $1 > /dev/null

  if [ $? -eq 0 ]; then
    echo -n "$2$separator"
  else
    echo -n ""
  fi
}

app "steam" "󰓓"
app "telegram-desktop" "󰔁"
app "nextcloud" "󰀸"
app "Discord" "󰙯"
