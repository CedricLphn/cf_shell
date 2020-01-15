#!/bin/zsh

whoami
./genTick $1 | ./genSensorData 1>> $2 2>> $3 