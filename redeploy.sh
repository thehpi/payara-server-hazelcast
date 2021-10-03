#!/bin/bash

nr=${1:-4}

asadmin --port=${nr}4848 undeploy rest
asadmin --port=${nr}4848 deploy --upload=true target/rest.war
