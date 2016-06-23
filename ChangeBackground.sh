#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 0;
fi

if [ $# = 0 ]; then
	echo "Usage: $0 path/to/image"
	exit 0;
fi

if [ -f "$1" ]; then
	
	cp "$1" /usr/share/backgrounds/background.png
	nitrogen --set-centered --save /usr/share/backgrounds/background.png
	UpdateGrub.sh
fi

exit 0;
