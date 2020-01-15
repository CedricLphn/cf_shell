#!/bin/zsh

dir="$2"
logs=$3
errors=$4
interval=$1

if [ ! -d "$dir" ]; then
  mkdir $dir
fi

whoami
./genTick $interval | ./genSensorData 1>> $dir/$logs 2>> $dir/$errors