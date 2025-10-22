#!/bin/bash

# PostgreSQLを起動
if [ -f /etc/debian_version ]; then
    export PGDATA="/var/lib/postgresql/16/main"
    PG_CMD="/usr/lib/postgresql/16/bin/postgres -D $PGDATA -c config_file=/etc/postgresql/16/main/postgresql.conf"
else
    export PGDATA="/var/lib/pgsql/16/data"
    PG_CMD="/usr/pgsql-16/bin/postgres -D $PGDATA"
fi

echo "Starting PostgreSQL with command: $PG_CMD"

# PostgreSQL をバックグラウンドで起動
$PG_CMD &
PG_PID=$!

# PostgreSQL の起動完了を待機
echo "Waiting for PostgreSQL to be ready..."
until pg_isready -U postgres >/dev/null 2>&1; do
    sleep 1
done
echo "PostgreSQL is ready."

# postgresユーザーにパスワードを設定
echo "Setting password for user postgres."
psql -U postgres -d postgres -c "ALTER USER $POSTGRES_USER WITH PASSWORD '${POSTGRES_PASSWORD}';"

# userdbデータベースが存在しなければ作成
echo "Creating database userdb if it does not exist."
psql -U postgres -d postgres -c "CREATE DATABASE ${POSTGRES_DB};" 2>/dev/null || echo "Database $POSTGRES_DB already exists."

# フォアグラウンドで PostgreSQL プロセスを監視するために待機
wait $PG_PID