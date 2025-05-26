#!/bin/bash

#brutforcing the pdf 
#added this line using the github.com 

#trying to access file via command line
path1="/home/saii/pdf"
file="form_protected.pdf"
protected_file="$path1/$file"
#trying unlocking with knownpasswd


for (( i=200001; i<=300000; i++ ))
do 

#trying decrypting
contain=$(qpdf --password=$i --show-encryption "$protected_file" | awk 'NR==1')


if [[ $contain != "Incorrect password supplied" ]];then
	echo "password found:$i"
exit 0
fi

done
echo " password not found in this range "
exit 1
