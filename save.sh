#!/bin/bash
cd ~/Documents/TiddlyNode/
cd ./blog-precursor/tiddlers/
rm \$__StoryList.tid
git add .
git commit -m "Automated save by Stanislaw"
git pull
git push
cd ~/Documents/TiddlyNode/
tiddlywiki blog-precursor --output ~/Documents/TiddlyNode/n-simplex.github.io/ --build index
cd ./n-simplex.github.io/
git add index.html
git commit -m "Automated save by Stanislaw"
git pull
git push
cd ..
printf "\n"
echo Saved and completed at
echo " $(date +"%H:%M:%S ")" | toilet -f future --filter border
echo ======================
echo Automation and Wiki brought to you by
awk '{print $0; system("sleep .3");}' art.txt
