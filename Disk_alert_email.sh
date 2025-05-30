#!/bin/bash

#to give email upon disk space less 

FU=$(df -hT | grep "sda2" |awk '{print $6}' | tr -d %)
TO="www.rahulroy7878@gmail.com"

if [[ $FU -ge 80 ]];then
	echo "Disk space is running low:$FU%" | mail -s "Disk space Alert!!!!" $TO
else 
	echo "all good"
fi


