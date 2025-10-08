FROM openjdk:17-slim

# 作業ディレクトリの設定
WORKDIR /app

# jarファイルをコンテナにコピー
COPY dtc-api-back-boot-0.0.1-SNAPSHOT.jar app.jar

# ポートを開放
EXPOSE 8081

# 起動コマンド
ENTRYPOINT ["java", "-jar", "app.jar", "--spring.profiles.active=dev1"]