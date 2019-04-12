FROM ruby:2.6-alpine

RUN apk add --update --no-cache \
      build-base \
      nodejs \
      tzdata \
      libxml2-dev \
      libxslt-dev \
      postgresql-dev \
      yarn \
      git \
      chromium \
      chromium-chromedriver
RUN bundle config build.nokogiri --use-system-libraries

RUN mkdir /app
WORKDIR /app

EXPOSE 3000

ENV BUNDLE_PATH /gems

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
