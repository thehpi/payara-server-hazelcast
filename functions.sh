#!/bin/bash

#--------------------------------------------------------------------------------------
getIps() {
	for i in $@
	do
		docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' payara${i}
	done
}

#--------------------------------------------------------------------------------------
expandVariables() {
	set -u

	echo "cat <<EOF
$(cat "$@")
EOF" | bash
}
