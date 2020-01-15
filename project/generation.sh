#!/bin/zsh

dir="$HOME/romu/$2"
logs=$3
errors=$4
interval=$1

username=$(whoami)

if [ ! -d "$dir" ]; then
  mkdir -p $dir
fi

<<<<<<< Updated upstream
echo $username

if [ $username = "leprohoncedric" ]
then
    ./genTick $interval | ./genSensorData 2>> $dir/$errors | stdbuf -oL cut -d : -f1,2,3,6 1>> $dir/$logs
else
    echo "Unauthorized access. Shutdown."
fi
=======
whoami
./genTick $interval | ./genSensorData 2>> $dir/$errors | stdbuf -oL cut -d : -f1,2,3,6 1>> $dir/$logs
>>>>>>> Stashed changes
