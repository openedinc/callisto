FROM ruby:2.4.3-slim

RUN apt-get update -qq \
  && apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends wget

RUN wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" | \
  tee /etc/apt/sources.list.d/postgresql.list
RUN wget -qO - https://deb.nodesource.com/setup_8.x | bash -
RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get update -qq \
	&& apt-get install -y --no-install-recommends \
    gcc \
    libc6-dev \
    libpq-dev \
    make \
    nodejs \
    postgresql-client-9.6 \
  && apt-get remove -y \
    wget \
  && rm -rf /var/lib/apt/lists/*

RUN gem install bundler --no-ri --no-rdoc
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --jobs 20 --retry 5
COPY . /app

ENTRYPOINT ["./bin/docker-entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
