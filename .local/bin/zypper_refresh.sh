#! /bin/sh

updates=$(zypper lu 2>/dev/null | grep --count '^v  | ')

    if [ -n "$updates" ] && [ "$updates" -gt 0 ]; then
        TEXT=" Pending Updates"
        notify-send "System Updates" "$updates$TEXT" -i update-manager
    fi

clear && exit
