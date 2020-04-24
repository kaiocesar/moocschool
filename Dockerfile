FROM ruby:2.6.3
ENV RAILS_ENV="development"
ENV RACK_ENV=$RAILS_ENV

RUN apt-get update && \
    apt-get install -y nodejs npm && \
    apt-get install -y --no-install-recommends postgresql-client && \
    rm -rf /var/lib/apt/lists/*

RUN npm install npm@latest -g

RUN mkdir /myapp
WORKDIR /myapp

COPY ./Gemfile* /myapp/
RUN bundle install --without development test

COPY . /myapp
RUN npm install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["bundle". "exec", "puma", "-C", "config/puma.rb"]
