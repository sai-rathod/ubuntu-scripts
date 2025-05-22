#!/bin/bash
#creating a script to send alert on ram space low 

Ram=$(free -mt | grep "Total" | awk '{print $4}')

TH=500
To=www.rahulroy7878@gmail.com

if [[ $Ram -le $TH ]];then
	echo "Warning Ram space is running low:$Ram" | mail -s "Ram space alert!!!" $To
else 
	echo "everything is good"
fi

