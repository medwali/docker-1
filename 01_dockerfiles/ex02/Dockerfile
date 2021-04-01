FROM ruby:latest

RUN apt update && apt install -y nodejs 
RUN gem install rails

ONBUILD COPY . /opt/app
ONBUILD WORKDIR /opt/app
ONBUILD RUN bundle install
ONBUILD RUN rake db:migrate
ONBUILD RUN rake db:seed

