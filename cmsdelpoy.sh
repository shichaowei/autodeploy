#!/bin/sh

#kill -9 $(ps -ef | grep edn-cms-test | grep -v grep | awk  '{print $2}')
#杀死cms进程
sh killpro.sh edn-cms-test
softwaredir=edn-cms-test
cmssoftwarename=$1 
cd /app/edn-cms-test/apache-tomcat-7.0.65/webapps/ROOT
rm -rf *
cp /app/software/$cmssoftwarename /app/$softwaredir/apache-tomcat-7.0.65/webapps/ROOT
cd /app/$softwaredir/apache-tomcat-7.0.65/webapps/ROOT
jar -xvf $cmssoftwarename
cd /app/$softwaredir/apache-tomcat-7.0.65/webapps/ROOT/WEB-INF/classes
cp -f /app/softwareconf/cms/application.properties .
cp -f /app/softwareconf/cms/applicationContext-task.xml .
cd /app/$softwaredir/apache-tomcat-7.0.65/bin
./startup.sh start
cd ../logs;
tail -f catalina.out


