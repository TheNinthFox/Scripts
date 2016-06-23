#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 0;
fi

sudo grub-mkconfig -o /boot/grub/grub.cfg

exit 0;
