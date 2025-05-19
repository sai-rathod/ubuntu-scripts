#!/bin/bash

#brutforcing the pdf 

#trying to access file via command line
path1="/home/saii/pdf"
path2="/home/saii/pdf/unlocked"
file="Sayindra-DevOps_protected.pdf"
protected_file="$path1/$file"
#trying unlocking with knownpasswd


for (( i=0; i<=999999; i++ ))
do 

#trying decrypting
output=$(qpdf --password=$i --show-encryption "$path2/$RANDOM.pdf" &> /dev/null | grep "Incorrect password supplied")

#matching the output

if [[ $output != "Incorrect password supplied" ]];then
	echo "password found:$i"
exit 0
fi

done
echo " password not found in this range "
exit 1
