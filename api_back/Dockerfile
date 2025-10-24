FROM openjdk:17-slim

# 作業ディレクトリの設定
WORKDIR /app

# jarファイルをコンテナにコピー
COPY dtc-api-back-boot-0.0.1-SNAPSHOT.jar app.jar
COPY application.properties .

# zipをインストール
RUN apt update && apt install -y zip && apt install -y vim

# プロパティファイルを上書き
RUN mkdir -p ./BOOT-INF/classes
RUN cp application.properties ./BOOT-INF/classes/
RUN zip ./app.jar ./BOOT-INF/classes/application.properties

# ポートを開放
EXPOSE 8081

# 起動コマンド
ENTRYPOINT ["java", "-jar", "app.jar"]