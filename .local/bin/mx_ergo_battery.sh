#!/bin/sh

solaar show | awk '/Battery:/ {gsub(",", ""); print $2; exit}' | tr -d '%'
