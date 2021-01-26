#!/bin/bash

FEDORA_TAG=5.1.1
ModeshapeConfig=jdbc-postgresql
JDBCConfig="-Dfcrepo.postgresql.username=fcrepoadmin -Dfcrepo.postgresql.password=fcrepoadminpw -Dfcrepo.postgresql.host=127.0.0.1 -Dfcrepo.postgresql.port=5432"


podman build -t fcrepo:v1 \
       --build-arg="FEDORA_TAG=$FEDORA_TAG" \
       --build-arg="ModeshapeConfig=$ModeshapeConfig" \
       --build-arg="JDBCConfig=$JDBCConfig" \
       .
