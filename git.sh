#!/bin/bash
list=("added index file" "updated readme file" "did some extra calculations" "deleted media files" "extra code removed")
for i in {1..12}
do
  touch temp$i.txt
  git add temp$i.txt
  a="Sun Mar "
  b=$i
  c=" 14:00 2017 +0530"
  export GIT_AUTHOR_DATE=$a$b$c
  export GIT_COMMITTER_DATE=$a$b$c
  git commit -am "`echo ${list[$RANDOM % ${#list[@]}]}`"
  rm temp$i.txt
done

