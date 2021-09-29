#!/bin/bash

mvn clean install -DskipTests
for nr in 4 5 
do
	./deploy_postgres_driver.sh "${nr}"
	./unregister_dbTestDatabase.sh "${nr}"
	./register_dbTestDatabase.sh "${nr}"
	./redeploy.sh ${nr}
done
