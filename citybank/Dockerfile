FROM openjdk:17-slim

# PostgreSQL関連の環境変数設定
ENV POSTGRES_USER=postgres \
    POSTGRES_PASSWORD=postgres \
    POSTGRES_DB=citydb

# 必要なパッケージのインストール
RUN if [ -f /etc/debian_version ]; then \
      echo "Debian/Ubuntu環境"; \
      apt-get update && apt-get install -y wget gnupg lsb-release supervisor tar && \
      echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
      wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
      apt-get update && \
      apt-get install -y postgresql-16 postgresql-client-16 && \
      apt-get clean; \
    elif grep -qi "Amazon Linux" /etc/system-release || [ -f /etc/redhat-release ]; then \
      echo "Amazon Linux or CentOS/RHEL環境"; \
      yum update -y && yum install -y wget tar supervisor && \
      wget https://download.postgresql.org/pub/repos/yum/pgdg-redhat-repo-latest.noarch.rpm && \
      rpm -Uvh pgdg-redhat-repo-latest.noarch.rpm && \
      yum install -y postgresql16-server postgresql16 postgresql16-client && \
      yum clean all; \
    else \
      echo "未知の環境です。パッケージインストールはスキップします。"; \
    fi

# PostgreSQLの設定変更（外部接続許可）
RUN if [ -f /etc/postgresql/16/main/postgresql.conf ]; then \
      sed -i "s/^#listen_addresses =.*/listen_addresses = '*'/" /etc/postgresql/16/main/postgresql.conf && \
      echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/16/main/pg_hba.conf; \
    elif [ -f /var/lib/pgsql/16/data/postgresql.conf ]; then \
      sed -i "s/^#listen_addresses =.*/listen_addresses = '*'/" /var/lib/pgsql/16/data/postgresql.conf && \
      echo "host all all 0.0.0.0/0 md5" >> /var/lib/pgsql/16/data/pg_hba.conf; \
    else \
      echo "PostgreSQL設定ファイルが見つかりません。"; \
    fi

# 作業ディレクトリの設定
WORKDIR /app

# JARファイルをapp.jarとリネームしてコピー
COPY dtc-intermediary-server-module-0.0.1-SNAPSHOT.jar app.jar

# application.propertiesを同階層にコピー
COPY application.properties .

# logconfigを同階層にコピー
COPY logconfig.xml .

# トークン証明書を同階層にコピー
COPY issbank23q3_crt.pem .

# 利用者証明書セットを同階層にコピー
COPY RootCA_crt.pem .
COPY InterCA_crt.pem .
COPY citybank23q3_crt.pem .

# 秘密鍵を同階層にコピー（JKS利用時）
COPY citybank.jks .

# supervisordの設定ファイルをコピー
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# PostgreSQL起動待機スクリプトのコピー
COPY wait_for_postgres.sh .

# PostgreSQL起動スクリプトのコピー
COPY run_postgres.sh .

# PostgreSQLのデータディレクトリ作成と権限変更、スクリプトに実行権限付与
RUN if [ -d /etc/postgresql/16/main ]; then \
      mkdir -p /var/lib/postgresql/16/main && \
      chown -R postgres:postgres /var/lib/postgresql; \
    elif [ -d /var/lib/pgsql/16/data ]; then \
      mkdir -p /var/lib/pgsql/16/data && \
      chown -R postgres:postgres /var/lib/pgsql; \
    fi && \
    chmod +x /app/wait_for_postgres.sh && \
    chmod +x /app/run_postgres.sh

# コンテナ外部への公開ポート
EXPOSE 8080 5432

# supervisordによりプロセスを管理
CMD ["/usr/bin/supervisord"]
