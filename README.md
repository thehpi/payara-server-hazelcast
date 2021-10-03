# payara-server-hazelcast

This repo was created to demonstrate payara which uses hazelcast to provide 2nd level JPA cache
for multiple instances.

Two docker instances with payara are started plus a postgresql database.

A generated hazelcast configuration file is used instead of the payara settings.

The previous version (see git history) uses payara configuration.

## Run

Start containers and generate hazelcast-config.xml

	./restart.sh

Setup payara, build and deploy app

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

