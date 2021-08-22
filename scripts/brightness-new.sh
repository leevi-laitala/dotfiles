#!/bin/sh
barAccuracy=5
#barFull="–"
#barEmpty="-"

function get_volume {
  xbacklight -get
}

curVol=`get_volume`

barWidth=$(expr `get_volume` / $barAccuracy)
barWidthMax=$(expr 100 / $barAccuracy)

#bar=$(echo `get_volume`% \ \ $(for (( i=0; i<$barWidth; ++i)); do echo -n $barFull; done && for (( i=0; i<$(expr $barWidthMax - $barWidth); ++i)); do echo -n $barEmpty; done && echo ""))

bar=$(echo -e `get_volume`% \ \ \ $($HOME/Projects/Code/volbar/volbar $barWidthMax $barWidth 0))

dunstify -i wb_incandescent -t 3000 -r 2594 -u low "$bar"
