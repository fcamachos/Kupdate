#!/bin/bash 

pid=$$
sh update_progress.sh "$pid"

for i in 1 2 3 4 5
do
    sleep 1
  echo "Looping ... number $i"
done

# echo $$