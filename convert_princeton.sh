#!/bin/sh
### This script was used to convert the photography I submitted
### as part of my art supplement to my Princeton application to
### meet the file constraints.
FILES=~/Downloads
for f in $FILES/*.jpg
do
    convert $f -resize 900x700 ${f%.*}-new.jpg;
    mkdir -p $FILES/out;
    mv $FILES/*-new.jpg $FILES/out;

done
