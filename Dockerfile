FROM elixir:latest
MAINTAINER Minh Tran <thminhkg@gmail.com>

RUN mix local.hex --force \
 && mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez \
 && apt-get update \
 && curl -sL https://deb.nodesource.com/setup_6.x | bash \
 && apt-get install -y apt-utils \
 && apt-get install -y nodejs \
 && apt-get install -y build-essential \
 && apt-get install -y inotify-tools \
 && mix local.rebar --force

ENV APP_HOME /code
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

EXPOSE 4000

CMD ["mix", "phx.server"]