#!/bin/bash
#the script will zip the file which are larger than 40M and older than 30days 

Base="/home/saii"

if [[ ! -d "$Base/archive" ]];then
echo "folder not found, creating one..."
mkdir -p $Base/archive
fi

for i in $(find "$Base" -maxdepth 1 -type f \( -size +40M -o -mtime +30 \));do
	echo "found a file: $i"
	gzip "$i" || exit 1
	mv "$i.gz" "$Base/archive"
done
echo "no files found"

