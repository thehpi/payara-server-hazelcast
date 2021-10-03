#!/bin/bash

docker-compose down
docker-compose up -d

./generateHazelcastConfig.sh

