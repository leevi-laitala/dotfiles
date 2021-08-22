#!/bin/sh
curVol=$(pulsemixer --get-volume | awk '{print $1}')
isMuted=$(pulsemixer --get-mute | grep -q '1' && echo "1" || echo "0")

bar=$(echo -e $curVol% \ \ \ $($HOME/Projects/Code/volbar/volbar 20 $(($curVol / 5)) $isMuted))
barMapped=$((3 - (100 - $curVol) / (100 / 3)))

if [ "$isMuted" = "1" ]; then
  dunstify -i volume_off -t 3000 -r 2593 -u low "$bar"
else
  case $barMapped in
  0)
    icon=volume_mute
    ;;
  1)
    icon=volume_mute
    ;;
  2)
    icon=volume_down
    ;;
  3)
    icon=volume_up
    ;;
  esac

  dunstify -i $icon -t 3000 -r 2593 -u low "$bar"
fi
