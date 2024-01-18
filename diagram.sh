#!/bin/bash
cp template.tex templatenew.tex
vim templatenew.tex
pdflatex --interaction=batchmode templatenew.tex
NAME="$(date +"%Y%m%d%H%M").svg"
pdf2svg templatenew.pdf $NAME
sed -i -- 's/rgb(100%, 100%, 100%)/rgb(8.6%, 9.4%, 10.6%)/g' $NAME
sed -i -- 's/0%/100%/g' $NAME
rm templatenew.*
rm "$NAME--"
echo "title: $NAME
type: image/svg+xml" >> "$NAME.meta"
echo "[img class="center" width=350 [$NAME]]" | pbcopy
