#!/bin/bash

cd ~/Music
for i in *; do
  cd "$i";
  for j in *; do
    ~/Skripte/production/./kdeconnect-cli --share "$j" -n HUAWEI;
    sleep 5;
    echo $j;
  done
  cd ..
done



