#!/usr/bin/env bash

OUTPUT=$(swaymsg -t get_outputs \
  | jq -r '.[] | select(.focused==true) | .name')

SCALE=$(swaymsg -t get_outputs \
  | jq -r ".[] | select(.name==\"$OUTPUT\") | .scale")

echo output $OUTPUT
echo scale $SCALE

if [[ "$SCALE" == "1.0" ]]; then
    swaymsg output "$OUTPUT" scale 2
else
    swaymsg output "$OUTPUT" scale 1
fi

killall waybar
waybar &
