#!/bin/bash
cd ~/Documents/PhD-Notes/tiddlers/
rm \$__StoryList.tid
git add .
git commit -m "Automated save by Stanislaw on Linux Laptop"
git pull
git push
printf "\n"
echo Saved and completed at
echo " $(date +"%H:%M:%S ")" | toilet -f future --filter border
echo ======================
echo Automation and Wiki brought to you by
awk '{print $0; system("sleep .3");}' ~/art.txt
