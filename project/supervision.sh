#!/bin/zsh

# all arguments
dir="$HOME/romu/$2"
logs=$3
errors=$4
interval=$1
size=$5

username=$(whoami)
message="none";

# checking users
# checking if logs exists
# checking if generation.sh is running
# get size of files
# set (not) exceed for each files
# writing final message
# kill generation and child processes
# creating status file
# compressing the dir
# displaying the final message
if [ $username = "leprohoncedric" ] || [ $username = "flow2dot0-osx" ] && [ -d "$dir" ]
then
    echo "INFO: current user accepted."
    if [ ! -d "$dir" ];
    then
      echo "WARNING: Logs not found."      
    elif [ $(ps -ef | grep generation | wc -l) != 2 ]
      then
            echo "WARNING: generation.sh is not running."
            exit 1
    else
        minimumsize=$size
        actualsize_logs=$(wc -c <"$dir/$logs")
        logs_exceed_status="not exceeded"
        actualsize_errors=$(wc -c <"$dir/$errors")
        errors_exceed_status="not exceeded"
        if [ $actualsize_logs -ge $minimumsize ]
        then
            logs_exceed_status="exceeded"
            killall genTick
            wc -l $dir/$3 | awk '{ print $1 }' >> "status.log"
            wc -l $dir/$4| awk '{ print $1 }' >> "status.log"
            zip -r $(date '+%Y-%m-%d-%H-%M-%S').zip $dir/ status.log
            rm status.log
        fi

        if [ $actualsize_errors -ge $minimumsize ]
        then
            errors_exceed_status="exceeded"
            killall genTick
            wc -l $dir/$3 | awk '{ print $1 }' >> "status.log"
            wc -l $dir/$4| awk '{ print $1 }' >> "status.log"
            zip -r $(date '+%Y-%m-%d-%H-%M-%S').zip $dir/ status.log
            rm status.log
        fi
        message="[ logs file : [ size :      $actualsize_logs, limit : $logs_exceed_status  ] ] [ errors file : [ size :        $actualsize_errors, limit : $errors_exceed_status ] ]"
    fi
fi

if [ ! $message = "none" ]
then
    echo $message

fi
