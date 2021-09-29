#!/bin/bash

nr=${1:-4}

server -${nr} -udpa rest
server -${nr} -dpf target/rest.war
