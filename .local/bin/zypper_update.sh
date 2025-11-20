#!/bin/sh

# Launch full system update
echo "Launching System Update"
echo "Intro Password:"

sudo zypper ref && sudo zypper dup

# Verify dependencies
sudo zypper ve && exit
