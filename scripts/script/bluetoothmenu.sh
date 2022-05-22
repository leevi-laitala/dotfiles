#!/usr/bin/env bash
mainmenu () {
    POWER_STATUS=$(bluetoothctl show | grep $(bluetoothctl list | awk '{print $2}') -A 4 | grep -q 'no' && echo "(off  )" || echo "(   on)")

    OPT=$(echo -e "Power $POWER_STATUS\nDevice list\nExit" | dmenu -i -p "Main menu")

    if echo $OPT | grep -q "Power"; then
        echo $OPT | grep -q "on" && bluetoothctl power off || bluetoothctl power on
        mainmenu
    fi

    echo $OPT | grep -q "Device list" && devicelist
}

devicelist () {
    OPT=$(bluetoothctl devices | sed -r 's/Device [a-fA-F0-9]{2}(:[a-fA-F0-9]{2}){5} //g' | dmenu -i -p "Devices")
    
    if grep -q "$OPT" <<< $(bluetoothctl devices | sed -r 's/Device [a-fA-F0-9]{2}(:[a-fA-F0-9]{2}){5} //g'); then
        DEV=$(bluetoothctl devices | grep "$OPT" | awk '{print $2}')
        device $DEV
    else
        echo "No such device"
        mainmenu
    fi
}

device () {
    DEVICE=$(bluetoothctl devices | grep $1 | sed -r 's/Device [a-fA-F0-9]{2}(:[a-fA-F0-9]{2}){5} //g')

    OPT=$(echo -e "Connect\nStatus\nDelete" | dmenu -i -p "$DEVICE")
    
    devicelist
    #device $(bluetoothctl devices | grep "$DEVICE" | awk '{print $2}') 
}

mainmenu

