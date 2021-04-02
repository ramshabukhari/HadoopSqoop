#!/bin/bash

# building hadoop image first and using that as a base for sqoop

docker build -t hadoop-base docker/hadoop/hadoop && \
docker build -t sqoop-base docker/sqoop && \
docker-compose up -d --build
