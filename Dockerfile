# ベースイメージを指定
FROM ubuntu:20.04

# 環境変数を設定
ENV DEBIAN_FRONTEND=noninteractive

# パッケージの更新と必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    nodejs \
    curl \
    wget \
    npm \
    git \
    && apt-get clean

# Pythonのパッケージをアップグレード
RUN pip3 install --upgrade pip

# Pythonのパッケージのインストール
RUN pip3 install SQLAlchemy~=1.4.28
RUN pip3 install psycopg2-binary
RUN pip3 install api~=0.0.7
RUN pip3 install pytz==2019.1
RUN pip3 install django-cors-headers
RUN pip3 install django-filter
RUN pip3 install djangorestframework-jwt
RUN pip3 install PyJWT
RUN pip3 install sqlparse==0.3.0
RUN pip3 install Django
RUN pip3 install djangorestframework
RUN pip3 install DateTime~=4.3
RUN pip3 install requests
RUN pip3 install uuid~=1.30
RUN pip3 install django-allauth
RUN pip3 install djoser
RUN pip3 install gspread~=5.4.0
RUN pip3 install oauth2client
RUN pip3 install google~=3.0.0
RUN pip3 install pandas
RUN pip3 install numpy
RUN pip3 install matplotlib
RUN pip3 install channels
RUN pip3 install mock
RUN pip3 install pygame
RUN pip3 install click
RUN pip3 install python-dateutil

# RUN pip3 install -r requirements.txt

# Node.jsとnpmのバージョンを更新
RUN npm install -g n
RUN n stable

# Vue.jsのインストール
RUN npm install -g @vue/cli

# 各プロジェクトはdocker構築後に作成する
# Djangoプロジェクトの作成
WORKDIR /money
RUN django-admin startproject server

# # Vue.jsアプリケーションの作成
# アプリケーション設定の場合はコンテナ作成後に作成する
RUN vue create client .

# ポートを公開
EXPOSE 8000
EXPOSE 5173

# コンテナを実行
CMD ["bash", "-c", "python3 /money/server/manage.py runserver 0.0.0.0:8000 & cd /money/client && npm run dev"]
