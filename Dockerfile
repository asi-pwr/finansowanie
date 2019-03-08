FROM ruby:2.5.3-alpine

RUN apk update && apk add build-base nodejs postgresql-dev tzdata

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs --without test --without development

COPY . .

CMD puma -C config/puma.rb
