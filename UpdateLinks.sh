#!/bin/bash

# Color definitions
source ./Colours.sh

# Check for root
if [ "$(id -u)" -ne "0" ]; then
	echo "Script must be run as root"
	exit 0;
fi

# List the scripts
scripts=`ls | grep .sh`
printf "${GREEN}[${WHITE}SCANNING${GREEN}]${WHITE}: \n"
for script in $scripts
do
	printf "${WHITE}	$script\n"
done
echo "";

# List all new scripts for which symlinks are created
for script in $scripts
do
	directory=`pwd`
	scriptname=`echo $script | cut -d . -f1 `
	printf "${GREEN}[${WHITE}Processing${GREEN}]${WHITE}: ${GREEN}$scriptname\n"

	if ls /usr/local/bin | grep -q $scriptname 
	then
		printf "${WHITE}	Link for script $script exists already, going on ...\n"
	else
		printf "${WHITE}	Creating link for script $script ...\n"
		sudo ln -s "$(pwd)/${scriptname}.sh" "/usr/local/bin/$scriptname"
	fi
	
	echo ""
done

printf "${GREEN}[${WHITE}DONE${GREEN}]"
exit 0
