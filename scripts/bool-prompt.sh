#!/bin/sh
[ $(echo -e "No\nYes" | dmenu -p "$1") == "Yes" ] && $2
