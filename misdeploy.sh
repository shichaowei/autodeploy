#!/bin/sh

#kill -9 $(ps -ef | grep edn-cms-test | grep -v grep | awk  '{print $2}')
#杀死cms进程

killprodir=/app/script/killpro.sh
softwarerootdir=/app/edn-mis
missoftwarename=$1 
sh $killprodir /app/edn-mis;
cd /app/edn-mis;
rm -rf *;
cp /app/software/$missoftwarename $softwarerootdir
unzip $missoftwarename
cd ./bin
cp -rf /app/softwareconf/mis/* .
./appctrl.sh start;
sleep 1;
cd ../logs/;
tail -f mis.log;




