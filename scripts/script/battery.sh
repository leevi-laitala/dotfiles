#!/bin/sh
#notify-send -t 3000 "Battery info" "$(acpi | sed 's/Battery 0: //g')"

batterylvl=$(acpi | awk '{print $4}' | sed 's/%,//g')
ischarging=0

if $(acpi | grep "Charging" &> /dev/null); then
  ischarging=1
fi

#echo "Charging: $ischarging"
#echo "Charge:   $batterylvl %"
#echo "Filename: $($HOME/Projects/c++/battery-clamp/battery-clamp "$batterylvl" "$ischarging")"

dunstify -r 1234 -i $($HOME/Code/battery-clamp/battery-clamp $batterylvl $ischarging) -t 10000 "Battery info" "$(acpi | sed 's/Battery 0: //g')"
