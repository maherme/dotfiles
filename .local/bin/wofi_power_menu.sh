#!/usr/bin/env bash

## Wofi Powermenu for Hyprland

# Configurable Variables
use_icons=true  # Set to false to disable icons

# Wofi configuration files
CONFIG="${WOFI_CONFIG:-$HOME/.config/wofi/config}"
STYLE="${WOFI_STYLE:-$HOME/.config/wofi/style.css}"

# Wofi commands
wofi_command="wofi --show dmenu --conf ${CONFIG} --style ${STYLE} --width=600 --height=325 --hide-search"
wofi_confirm="wofi --show dmenu --conf ${CONFIG} --style ${STYLE} --width=600 --height=150 --hide-search"

# Get system uptime
uptime=$(uptime -p | cut -d' ' -f2-)

# Menu options with or without icons
if $use_icons; then
    shutdown="   Shutdown"
    reboot="   Reboot"
    lock="   Lock"
    suspend="   Sleep"
    logout="   Logout"
else
    shutdown="Shutdown"
    reboot="Reboot"
    lock="Lock"
    suspend="Sleep"
    logout="Logout"
fi

# Confirmation prompt
confirm_action() {
    response=$(echo -e "No\nYes" | $wofi_confirm)
    [[ "$response" == "Yes" ]]
}

# Open Wofi menu
open_menu() {
    options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"
    chosen=$(echo -e "$options" | timeout 10s $wofi_command)

    [[ -z "$chosen" ]] && exit 0  # Exit if no selection is made

    case $chosen in
        "$shutdown")
            if confirm_action; then
                notify-send "System is shutting down..."
                sleep 2
                systemctl poweroff
            fi
            ;;
        "$reboot")
            if confirm_action; then
                notify-send "Rebooting system..."
                sleep 2
                systemctl reboot
            fi
            ;;
        "$lock")
            swaylock -f -c 000000
            ;;
        "$suspend")
            if confirm_action; then
                notify-send "Suspending system..."
                sleep 2
                systemctl suspend
            fi
            ;;
        "$logout")
            if confirm_action; then
                notify-send "Logging out..."
                sleep 2
                swaymsg exit
            fi
            ;;
    esac
}

# Prevent multiple instances
if pgrep -fx "wofi --show dmenu" > /dev/null; then
    pkill -f "wofi --show dmenu"
else
    open_menu
fi
