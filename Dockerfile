FROM ruby:2.6.1-alpine3.9

LABEL maintainer="devops@firefield.com"

RUN apk add --no-cache --update build-base linux-headers
RUN apk add --no-cache --update git file

ENV APP_PATH /usr/src/app
WORKDIR $APP_PATH

ADD Gemfile $APP_PATH
ADD Gemfile.lock $APP_PATH

COPY . .

RUN bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3
