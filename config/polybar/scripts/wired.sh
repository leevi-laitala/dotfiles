#!/bin/sh

interface="eno1"

nmcli|rg -i -j 8 "$interface: connected" > /dev/null

if [ $? -eq 0 ]; then
  echo ""
  #echo "󰈁"
else
  echo "󰈂"
fi
