FROM ruby:2.4
MAINTAINER Eric Raio

# cmake is required by pronto
RUN apt-get update -y && \
      apt-get install -y cmake

RUN gem install pronto \
    # just list all the linters you are planning to use
    pronto-rubocop \
    --no-document

# copy over various default linter files
COPY rubocop.yml /root/.rubocop.yml
