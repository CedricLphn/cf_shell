#!/bin/zsh

# all arguments
dir="$HOME/romu/$2"
logs=$3
errors=$4
interval=$1

username=$(whoami)

# create dir if not exist
if [ ! -d "$dir" ]; then
  mkdir -p $dir
fi

echo $username

# checking users
# redirecting outputs and creating dir and files
if [ $username = "leprohoncedric" ] || [ $username = "flow2dot0-osx" ]
then
    ./genTick $interval | ./genSensorData 2>> $dir/$errors | stdbuf -oL cut -d : -f1,2,3,6 1>> $dir/$logs
else
    echo "Unauthorized access. Shutdown."
fi

# trapping the SIGINT
# display on standard output
trap 'increment' 2
echo "INFO: SIGINT supervision catched"
