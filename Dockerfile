FROM ruby:2.6-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential && \
    apt-get install -y libpq-dev postgresql-client && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

RUN gem install bundler -v 1.17.3

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install --no-cache

COPY . /app

ENV HANAMI_ENV=development
EXPOSE 8080

CMD bundle exec hanami server --host=0.0.0.0 --port=8080
