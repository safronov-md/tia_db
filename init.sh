#!/bin/bash

# Wait for the PostgreSQL server to start
until pg_isready -h postgres -p 5432 -U admin -d TIA
do
  echo "Waiting for PostgreSQL to start..."
  sleep 1
done

# Check if the database is already initialized
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "SELECT 1 FROM pg_tables WHERE schemaname = 'public' LIMIT 1;" | grep -q 1

if [ $? -ne 0 ]; then
  echo "Initializing database..."
  psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /docker-entrypoint-initdb.d/1_init.sql
  psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /docker-entrypoint-initdb.d/2_mock_insert.sql
else
  echo "Database is already initialized. Skipping initialization."
fi

