#!/bin/bash
cd ~/Documents/TiddlyNode/
cd ./notes/tiddlers/
rm \$__StoryList.tid
git add .
git commit -m "Automated save by Stanislaw"
git pull
git push
cd ~/Documents/TiddlyNode
printf "\n"
echo Saved and completed at
echo " $(date +"%H:%M:%S ")" | toilet -f future --filter border
echo ======================
echo Automation and Wiki brought to you by
awk '{print $0; system("sleep .3");}' art.txt
