#/bin/sh
#修改时间 $1从外面传进来，表示修改的时间
date -s $1;
date -s $2;
killprodir=/root/script/shell/killpro.sh;
softwarerootdir=/usr/local/tomcat;
sh $killprodir /usr/local/tomcat;
cd $softwarerootdir/logs;
cd $softwarerootdir/bin;
./catalina.sh start;
#sleep 8s;
