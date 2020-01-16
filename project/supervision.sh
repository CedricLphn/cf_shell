#!/bin/zsh

dir="$HOME/romu/$2"
logs=$3
errors=$4
interval=$1
size=$5

username=$(whoami)

message="none";
dupe_script=$(ps -ef | grep "generation.sh" | grep -v grep | wc -l)

if [ $username = "leprohoncedric" ] || [ $username = "flow2dot0-osx" ] && [ -d "$dir" ]
then
    echo "INFO: current user accepted."
    if [ ! -d "$dir" ];
    then
      echo "WARNING: Logs not found."
    elif [ ! ${dupe_script} -gt 3 ]
      then
          echo "WARNING: generation.sh is not running."
    else
        minimumsize=$size
        actualsize_logs=$(wc -c <"$dir/$logs")
        logs_exceed_status="not exceeded"
        actualsize_errors=$(wc -c <"$dir/$errors")
        errors_exceed_status="not exceeded"
        if [ $actualsize_logs -ge $minimumsize ]
        then
            logs_exceed_status="exceeded"
        fi

        if [ $actualsize_errors -ge $minimumsize ]
        then
            errors_exceed_status="exceeded"
        fi
        message="[ logs file : [ size :      $actualsize_logs, limit : $logs_exceed_status  ] ] [ errors file : [ size :        $actualsize_errors, limit : $errors_exceed_status ] ]"
    fi
fi

if [ ! $message = "none" ]
then
    echo $message
fi

