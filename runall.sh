#!/bin/bash
#trying  running all scripts at once 
#
for scripts in pdfbruteforce*.sh
do
       if [[ -f "$scripts" ]];then	
	echo "running the $scripts now"
	./"$scripts" &
       fi
done

wait
