#!/bin/bash

echo creating 1
./testcreate.sh 4 

echo creating 2
id=$(./testcreate.sh 4 |jq -r .id)

echo creating 3
./testcreate.sh 4

echo show all
./testgetall.sh 4 | showjson

echo server 1: show 2nd
./testget.sh 4 $id | showjson

echo server 2: show 2nd
./testget.sh 5 $id | showjson

echo server1: update 2nd
./testupdate.sh 4 $id hoi1 | showjson

echo server 1: show 2nd
./testget.sh 4 $id | showjson

echo server 2: show 2nd
./testget.sh 5 $id | showjson

