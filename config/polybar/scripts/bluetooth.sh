#!/bin/sh

PWRON="󰂯"
PWROFF=""

(bluetoothctl show | grep -q "Powered: yes" && echo "$PWRON") || echo "$PWROFF"
