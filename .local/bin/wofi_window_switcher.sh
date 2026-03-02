#!/bin/bash

windows=$(swaymsg -t get_tree | jq -r '
  recurse(.nodes[]?, .floating_nodes[]?)
  | select(.type=="con" and .name!=null)
  | "\(.name)"
')

selected=$(echo "$windows" | wofi --dmenu --prompt "Opened Windows")

if [ -n "$selected" ]; then
  id=$(echo "$selected" | awk '{print $1}')
  swaymsg "[con_id=$id]" focus
fi
