FROM ruby:2.6.3

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs && \
    apt-get install -y yarn

RUN mkdir /myapp

WORKDIR /myapp

COPY Gemfile* /myapp/

RUN bundle install

COPY . /myapp


