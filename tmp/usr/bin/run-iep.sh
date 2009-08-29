#!/bin/sh

JAVA=/usr/bin/java
JPARAMS="-Xms32m -Xmx512m"
JARS="reconnoiter.jar activemq-all-5.2.0.jar antlr-runtime-3.1.1.jar \
	esper-3.1.0.jar log4j-1.2.15.jar \
	spring-beans-2.5.5.jar spring-context-2.5.5.jar \
	cglib-nodep-2.2.jar commons-pool-1.4.jar commons-dbcp-1.2.2.jar \
	postgresql-8.3-604.jdbc3.jar rabbitmq-client.jar commons-io-1.2.jar \
	commons-cli-1.1.jar"

DIRS=". lib /usr/java/lib /usr/java"
CP=

for jar in $JARS
do
	found=
	for dir in $DIRS
	do
		if [ -r "$dir/$jar" ]; then
			found="$dir/$jar"
			CP="$CP:$found"
			break
		fi
	done
	if [ -z "$found" ]; then
		echo "Cannot find $jar" 2>&1
		exit
	fi
done
exec $JAVA $JPARAMS -cp $CP com.omniti.reconnoiter.IEPEngine $*