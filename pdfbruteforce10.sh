#!/bin/bash

#brutforcing the pdf 
#added this line using the github.com 

#trying to access file via command line
path1="/home/saii/pdf"
path2="/home/saii/pdf/unlocked"
file="Sayindra-DevOps_protected.pdf"
protected_file="$path1/$file"
#trying unlocking with knownpasswd


for (( i=90001; i<=999999; i++ ))
do 

#trying decrypting
qpdf --password=$i --show-encryption "$protected_file" | grep "Incorrect password supplied" &> /dev/null 


if [[ $? -ne 0 ]];then
	echo "password found:$i"
exit 0
fi

done
echo " password not found in this range "
exit 1
