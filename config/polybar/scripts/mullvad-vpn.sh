#!/bin/sh

PWRON="󰦝"
PWROFF="󰦜"

(mullvad status | grep -q "Tunnel status: Connected" && echo "$PWRON") || echo "$PWROFF"
