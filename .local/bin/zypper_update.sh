#!/bin/sh

# Launch full system update
echo "Launching System Update"
echo "Intro Password:"

sudo zypper ref && sudo zypper dup

# Verify dependencies
sudo zypper ve && makoctl dismiss -n $NOTIF_ID && exit
