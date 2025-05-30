#!/bin/bash
#automatically pushing the changes made in the dir
ping -c 1 google.com > /dev/null 2>&1
if [[ $? -eq 0 ]];then

cd /home/saii/scripts || exit 0
git_changes=$(git status | awk 'NR==4')
current_date=$(date)

if [[ "$git_changes" != "nothing to commit, working tree clean" ]];then
	echo "changes found autocommiting and pushing the changes"
git add .
git commit -m "auto committed on date $current_date"
git push
else 
	echo "no changes found"
fi
else 
	echo " no internet connetion at:'$current_date' "
fi

