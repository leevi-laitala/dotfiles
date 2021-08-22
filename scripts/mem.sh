#!/bin/sh
notify-send -t 7000 "Most memory intensive applications:" "$(ps axch -o cmd:24,%mem --sort=-%mem | head)" &
