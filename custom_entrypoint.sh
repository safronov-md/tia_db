#!/bin/bash
set -e

docker-entrypoint.sh postgres &

until pg_isready -h postgres_container -p 5432 -U admin; do
  sleep 1
done

/docker-entrypoint-initdb.d/init.sh
wait
