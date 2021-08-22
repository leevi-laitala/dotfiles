#!/usr/bin/sh
opt1="Reload i3 config"
opt2="Restart i3"
opt3="Exit i3"

opt=$(echo -e "$opt1\n$opt2\n$opt3" | dmenu -i -p "What you want to do? " | grep "\<$opt1\>\|\<$opt2\>\|\<$opt3\>")
[ $? -eq 0 ] || exit 1

confirm=$(echo -e "No\nYes" | dmenu -i -p "Sure you want to $opt?")
[ $? -eq 0 ] || exit 3
[ $confirm == "Yes" ] || exit 4

case $opt in
    $opt1)
        i3-msg reload &
        exit 0
        ;;
    $opt2)
        i3-msg restart &
        exit 0
        ;;
    $opt3)
        i3-msg exit &
        exit 0
        ;;
esac
