FROM ruby:2.6.3-alpine

RUN apk add --update --no-cache bash build-base nodejs sqlite-dev tzdata postgresql-dev yarn

RUN gem install bundler:2

RUN mkdir /myapp

WORKDIR /myapp

COPY package.json yarn.lock ./

RUN yarn install --check-files

COPY Gemfile* /myapp/

RUN bundle install

COPY . /myapp

ENV PATH=./myapp/bin:$PATH

CMD ["rails", "console"]

