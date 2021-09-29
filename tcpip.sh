#!/bin/bash

getIps() {
	i=1
	unset c
	echo -n "${c}$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' payara-server-hazelcast_payara${i}_1):4900"

	i=2
	c=","
	echo "${c}$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' payara-server-hazelcast_payara${i}_1):4900"
}

#####################3

ips=$(getIps)

for i in 4 5
do
	server -$i -cc "set-hazelcast-configuration --dynamic --clustermode tcpip --tcpipmembers ${ips}"
done
