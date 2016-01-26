#!/bin/sh

#kill -9 $(ps -ef | grep edn-cms-test | grep -v grep | awk  '{print $2}')
#杀死cms进程

killprodir=/app/script/killpro.sh
softwarerootdir=/app/edn-web
cmssoftwarename=$1 
sh $killprodir /app/edn-web;

cd /app/edn-web/apache-tomcat-7.0.65/webapps/ROOT;
echo "sss"
rm -rf *;
cp /app/software/$cmssoftwarename $softwarerootdir/apache-tomcat-7.0.65/webapps/ROOT
cd $softwarerootdir/apache-tomcat-7.0.65/webapps/ROOT
jar -xvf $cmssoftwarename
cd $softwarerootdir/apache-tomcat-7.0.65/webapps/ROOT/WEB-INF/classes
cp -f /app/softwareconf/cms/application.properties .
cp -f /app/softwareconf/cms/applicationContext-task.xml .
cd $softwarerootdir/apache-tomcat-7.0.65/bin
./startup.sh start
cd ../logs;
tail -f catalina.out
#sh $killprodir cmsdeploy.sh;

