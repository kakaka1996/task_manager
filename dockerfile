#dockerhubからrubyイメージを持ってくる
FROM ruby:3.0.5

#debian系のためapt-getを使用してnode.jsとyarnをインストール
RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
&& apt get install -y nodejs
RUN npm install --global yarn

#docker内の作業ディレクトリの作成と設定
WORKDIR //task_management

COPY Gemfile Gemfile.lock /task_management/

#コンテナ内にコピーしたGemfileでbundle install
RUN bundle install


#rails 起動
CMD ["rails", "server", "-b", "0.0.0.0"]

