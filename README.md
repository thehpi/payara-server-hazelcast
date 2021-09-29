# payara-server-hazelcast

## Install

Start containers

	docker-compose up -d

Wait until done

	docker-compose logs --follow

Setup hazelcast ips

	./tcpip.sh

Setup payara and build app

	./build.sh

## Test

Run this script

	./test.sh

This script inserts 3 records, shows the 2nd record on both payara containers (to load it in the cache).
Then it updates the 2nd record on the 1st machine.
Then it shows the 2nd record on both machines.
Without cache coordination you would expect that the 2nd machine does not see the update.
But it is updated and returns the updated value.
If you check the logs you will also see no select statement is executed.

