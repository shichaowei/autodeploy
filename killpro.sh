#!/bin/sh
test=$(ps -ef | grep $1| grep -v grep | awk  '{print $2}')
echo $test
while [[ -n $test ]]
do
    kill -9 $test
    test=$(ps -ef | grep $1| grep -v grep | awk  '{print $2}')
    echo $test
done
