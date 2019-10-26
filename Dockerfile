FROM ruby:2.6.4
MAINTAINER Eric Raio

# cmake is required by pronto
RUN apt-get update -y && \
     apt-get install -y cmake && \
     gem install -N pronto \
     # just list all the linters you are planning to use
     pronto-rubocop

CMD [ "irb" ]
