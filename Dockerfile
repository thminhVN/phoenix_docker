FROM elixir:latest

# Install hex
RUN mix local.hex --force

# Install rebar
RUN mix local.rebar --force

# Install the Phoenix framework itself
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force

RUN apt-get install inotify-tools