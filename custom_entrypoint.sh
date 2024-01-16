#!/bin/bash
set -e

docker-entrypoint.sh postgres &

until pg_isready -h localhost -p 5432 -U postgres; do
  sleep 1
done

/docker-entrypoint-initdb.d/init.sh
wait
