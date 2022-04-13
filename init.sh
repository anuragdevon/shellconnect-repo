#!/bin/bash

# This Script will initiate the ssh connection to remote shell and keep it alive

#-----------------------------------------------------------------------------
# Defining Colors Schemes
if test -t 1; then

    # see if it supports colors...
    ncolors=$(tput colors)

    if test -n "$ncolors" && test $ncolors -ge 8; then
        bold="$(tput bold)"
        underline="$(tput smul)"
        standout="$(tput smso)"
        normal="$(tput sgr0)"
        black="$(tput setaf 0)"
        red="$(tput setaf 1)"
        green="$(tput setaf 2)"
        yellow="$(tput setaf 3)"
        blue="$(tput setaf 4)"
        magenta="$(tput setaf 5)"
        cyan="$(tput setaf 6)"
        white="$(tput setaf 7)"
    fi
fi
#-----------------------------------------------------------------------------

echo "${bold}${standout}REMOTE SHELL CONFIGURATION${normal}"
echo ""

echo "Checking sshd service status..."
STATUS=sudo systemctl status sshd.service | grep Active | awk '{ print $2 }'

if [ ${STATUS} -eq "inactive" ]; then
    echo >&2 "ssh service is not running!, Please start the ssh service."; exit 1;
fi

# Remote User Shell Details
REMOTE_SHELL_HOST_NAME=""
REMOTE_SHELL_HOST_IP=""
REMOTE_SHELL_PORT=""

echo -n "Enter the Remote shell Host Name: "
READ $REMOTE_SHELL_HOST_NAME

echo -n "Enter the Remote shell Host IP: "
READ $REMOTE_SHELL_HOST_IP

echo -n "Enter the Remote shell Host Name: "
READ $REMOTE_SHELL_PORT

echo "Initiating the ssh connection to remote shell..."
ssh phoenixnap@185.52.53.222 –p7654
ssh $REMOTE_SHELL_HOST_NAME@$REMOTE_SHELL_HOST_IP -p$REMOTE_SHELL_PORT

# After successfully entering to remote shell, begin the configuration management


