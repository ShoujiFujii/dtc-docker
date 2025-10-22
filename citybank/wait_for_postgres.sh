#!/bin/bash
if [ -f /etc/debian_version ]; then
  PG_ISREADY="/usr/lib/postgresql/16/bin/pg_isready"
elif grep -qi "Amazon Linux" /etc/system-release || [ -f /etc/redhat-release ]; then
  PG_ISREADY="/usr/pgsql-16/bin/pg_isready"
else
  PG_ISREADY="pg_isready"  # fallback：パスが通っている場合
fi

echo "Waiting for PostgreSQL to be ready..."
until $PG_ISREADY -h localhost -p 5432 -U $POSTGRES_USER; do
  sleep 1
done

echo "PostgreSQL is ready. Starting Spring Boot app..."
exec java -jar /app/app.jar --spring.config.location=file:/app/application.properties
