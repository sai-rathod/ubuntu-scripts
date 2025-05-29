#!/bin/bash
#to create a script to automatically create account and fill description

#Variables
Hostname="$(hostname)"
Username="$1"
Password="$(date +%s%3N)"
shift
GEcos="$@"

#checking the user identity
if [[ $UID -ne 0 ]];then
	echo "please run with the root account"
	exit 1
fi

#if name and GEcos is not given exit with warning!!!!
if [[ "$#" -lt 2 ]];then
	echo  "please provide username and GEcos in front"
	exit 1
fi

#creating the user with description
useradd -c "$GEcos" -m "$Username"
if [[ $? -ne 0 ]];then
	echo "error: user could not be created"
	exit 1
fi

#setting the password
echo "$Username:$Password" | chpasswd
if [[ $? -ne 0 ]];then
	echo "error: password could not be set"
fi

#forcing the user to change password after first login
passwd -e "$Username"

#final details
echo "Username - $Username"
echo "Password - $Password"
echo "Hostname - $Hostname"



