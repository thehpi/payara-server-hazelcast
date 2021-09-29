#!/bin/bash

nr=${1:-4}

export IDDOC_DB_CONF="user=testuser:password=testpassword:databaseName=testdatabase:serverName=mydb"

asadmin --port=${nr}4848 create-jdbc-connection-pool --datasourceclassname org.postgresql.xa.PGXADataSource --restype javax.sql.XADataSource --property ${IDDOC_DB_CONF} dbTestDatabase
asadmin --port=${nr}4848 create-jdbc-resource --connectionpoolid dbTestDatabase jdbc/dbTestDatabase
