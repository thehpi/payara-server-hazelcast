#!/bin/bash

nr=${1:-4}

asadmin --port=${nr}4848 delete-jdbc-resource jdbc/dbTestDatabase
asadmin --port=${nr}4848 delete-jdbc-connection-pool dbTestDatabase
