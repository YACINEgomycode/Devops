#!/bin/bash

list=("added index file" "updated readme file" "did some extra calculations" "deleted media files" "extra code removed")

# Loop through each month (1 to 12)
for month in {1..12}
do
  # Loop through 20 random days in the current month
  for ((day=2; day<=20; day++))
  do
    # Generate a random number of commits between 5 and 41
    num_commits=$((5 + RANDOM % 37))

    # Set the date to be a random time on the current day in the year 2017
    export GIT_AUTHOR_DATE="2017-$month-$day $(shuf -i 0-23 -n 1):$(shuf -i 0-59 -n 1):$(shuf -i 0-59 -n 1) +0530"
    export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"
    export GIT_AUTHOR_NAME="YACINEgomycode"
    export GIT_AUTHOR_EMAIL="jlassi_yassine@live.fr"
    export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
    export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

    # Loop to generate random commits for the current day
    for ((commit=1; commit<=num_commits; commit++))
    do
      touch temp${month}_${day}_${commit}.txt
      git add -A
      git commit -am "${list[$((RANDOM % ${#list[@]}))]}"
      rm temp${month}_${day}_${commit}.txt
    done
  done
  # Push the commits for the current month
  git push --force
done

