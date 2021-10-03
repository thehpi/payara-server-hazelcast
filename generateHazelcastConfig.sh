#!/bin/bash

. ${0%/*}/functions.sh

members=$(
unset c
getIps 1 2 | while read ip
do
	echo -n $c
	echo -n ${ip}:4900
	c=","
done
)

export members

expandVariables <hazelcast-config.xml.template  >hazelcast-config.xml
