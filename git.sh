#!/bin/bash

list=("added index file" "updated readme file" "did some extra calculations" "deleted media files" "extra code removed")

# Loop through each month (1 to 12)
for month in {1..10}
do
  # Create an array of 20 random unique day numbers
  random_days=($(shuf -i 1-31 -n 17 | tr ' ' '\n' | sort -n))

  for day in "${random_days[@]}"
  do
    # Generate a random number of commits between 5 and 41
    num_commits=$((5 + RANDOM % 37))

    # Set the date to be the selected day of the current month in the year 2017
    export GIT_AUTHOR_DATE="2023-$month-$day $(shuf -i 0-23 -n 1):$(shuf -i 0-59 -n 1):$(shuf -i 0-59 -n 1) +0530"
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
