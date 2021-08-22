#!/bin/sh
notify-send -t 7000 "Most CPU intensive applications:" "$(ps axch -o cmd:24,%cpu --sort=-%cpu | head)" &
