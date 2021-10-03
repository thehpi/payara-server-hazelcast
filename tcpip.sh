#!/bin/bash

#####################3

. ${0%/*}/functions.sh

#--------------------------------------------------------------------------------------
generateIpList() {
	local c ip

	getIps 1 2 | while read ip
	do
		echo -n "${c}${ip}:4900"
		c=","
	done
}

#--------------------------------------------------------------------------------------
expandVariables() {
	set -u

	echo "cat <<EOF
$(cat "$@")
EOF" | bash
}

#########################
ips=$(generateIpList)

for i in 4 5
do
	asadmin --port=${i}4848 set-hazelcast-configuration --dynamic --clustermode tcpip --tcpipmembers ${ips}
done
