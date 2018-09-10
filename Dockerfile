FROM ruby:2.5.1-alpine as builder

RUN apk update && apk upgrade
RUN apk --update add --no-cache \
  build-base \
  ca-certificates \
  git \
  postgresql-dev \
  ruby-dev \
  tzdata

ENV TZ UTC

RUN gem install bundler --no-ri --no-rdoc
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --jobs 20 --retry 5

FROM ruby:2.5.1-alpine

RUN apk update && apk upgrade
RUN apk --update add --no-cache \
  ca-certificates \
  nodejs-current \
  postgresql-dev \
  tzdata \
  yarn

ENV TZ UTC

WORKDIR /app
COPY . /app
COPY --from=builder $GEM_HOME $GEM_HOME
RUN bin/rails assets:precompile

ENTRYPOINT ["./bin/docker-entrypoint.sh"]
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
