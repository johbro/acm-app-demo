#!/bin/sh

docker run -d -e CLUSTERENV=local -p 8080:8080 --name webapp -t webapp:1.0
