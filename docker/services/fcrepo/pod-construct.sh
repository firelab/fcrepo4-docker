#!/bin/bash

podman pod create -p 8080:8080 --name fcrepo
podman run --pod fcrepo \
           -e "POSTGRES_USER=fcrepoadmin" \
           -e "POSTGRES_PASSWORD=fcrepoadminpw" \
           -e "POSTGRES_DB=fcrepo" \
           -e "PGDATA=/var/lib/postgresql/data/pgdata" \
           -v /home/bnordgren/Documents/hpiol/fcrepo_db:/var/lib/postgresql/data \
           --name fcrepo-postgres \
           -d \
           docker.io/library/postgres:9

podman run --pod fcrepo \
           --name fcrepo-tomcat \
           -d \
           fcrepo
         
