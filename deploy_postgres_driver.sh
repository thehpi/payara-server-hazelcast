#!/bin/bash

nr=${1:-4}

asadmin --port=${nr}4848 add-library --upload=true ${PWD}/postgresql-42.2.6.jar

