#!/bin/sh
log_file="/tmp/batt_log"
#echo "" > $log_file

#echo "[$(date +'%d/%m/%Y-%T')] [INFO] Initializing" >> $log_file

interval=30

batt_btw="30"
batt_low="15"
batt_cri="5"

snd_btw="/usr/share/sounds/Oxygen-Sys-App-Error.ogg"
snd_low="/usr/share/sounds/Oxygen-Sys-App-Error-Serious.ogg"
snd_cri="/usr/share/sounds/Oxygen-Sys-App-Error-Serious-Very.ogg"

if [[ -e /tmp/batt_btw ]]; then rm /tmp/batt_btw; fi
if [[ -e /tmp/batt_low ]]; then rm /tmp/batt_low; fi
if [[ -e /tmp/batt_cri ]]; then rm /tmp/batt_cri; fi

#echo "[$(date +'%d/%m/%Y-%T')] [INFO] Initializing finished, starting loop" >> $log_file

while [ true ]; do
  #echo "[$(date +'%d/%m/%Y-%T')] [INFO] --- Tick" >> $log_file

  batt_lvl="$(acpi -b | grep 'Battery 0:' | grep -v 'Charging' | grep -P -o '([0-9]+(?=%))')"

  if [[ -n "$batt_lvl" ]]; then # Check if battery is charging, execute if not
    #echo "[$(date +'%d/%m/%Y-%T')] [INFO] Not charging" >> $log_file

    if [[ "$batt_lvl" -le "$batt_cri" ]]; then
      if ! [[ -e /tmp/batt_cri ]]; then
        #echo "[$(date +'%d/%m/%Y-%T')] [WARN] Battery critical" >> $log_file

        touch /tmp/batt_cri
        touch /tmp/batt_low
        touch /tmp/batt_btw

        dunstify -i battery_alert -u critical -t 10000 "Battery info" "Battery charge critical\n Charge: $batt_lvl%"
        #$HOME/scripts/battery.sh
        paplay --volume 65536 "$snd_cri"
      fi
    fi

    if [[ "$batt_lvl" -le "$batt_low" ]]; then
      if ! [[ -e /tmp/batt_low ]]; then
        #echo "[$(date +'%d/%m/%Y-%T')] [WARN] Battery low" >> $log_file

        touch /tmp/batt_low
        touch /tmp/batt_btw

        dunstify -i battery_20 -u normal -t 10000 "Battery info" "Battery charge low\n Charge: $batt_lvl%"
        #$HOME/scripts/battery.sh
        paplay --volume 65536 "$snd_low"
      fi
    fi

    if [[ "$batt_lvl" -le "$batt_btw" ]]; then
      if ! [[ -e /tmp/batt_btw ]]; then
        #echo "[$(date +'%d/%m/%Y-%T')] [WARN] Battery relatively low" >> $log_file

        touch /tmp/batt_btw
        dunstify -i battery_30 -u normal -t 10000 "Battery info" "Battery charge relatively low\n Charge: $batt_lvl%"
        #$HOME/scripts/battery.sh
        paplay --volume 65536 "$snd_btw"
      fi
    fi

  else
    if [[ -e /tmp/batt_btw ]]; then rm /tmp/batt_btw; fi
    if [[ -e /tmp/batt_low ]]; then rm /tmp/batt_low; fi
    if [[ -e /tmp/batt_cri ]]; then rm /tmp/batt_cri; fi

    #echo "[$(date +'%d/%m/%Y-%T')] [INFO] Charging" >> $log_file
  fi

  sleep $interval
done
