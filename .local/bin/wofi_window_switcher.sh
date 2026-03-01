#!/bin/bash

windows=$(swaymsg -t get_tree | jq -r '
  .. | select(.type?) 
  | select(.type=="con" and .app_id!=null)
  | "\(.name)"
')

selected=$(echo "$windows" | wofi --dmenu --prompt "Opened Windows")

if [ -n "$selected" ]; then
  id=$(echo "$selected" | awk '{print $1}')
  swaymsg "[con_id=$id]" focus
fi
