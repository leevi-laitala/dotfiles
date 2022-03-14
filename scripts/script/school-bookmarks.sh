#!/usr/bin/zsh

dir=$(find /home/$USER/School/Yliopisto/Courses -type d -name "$(find /home/$USER/School/Yliopisto/Courses -maxdepth 3 -mindepth 3 -type d | sed 's/.*\///g' | dmenu -i -p "Search:")")

cd "$dir"
$SHELL
