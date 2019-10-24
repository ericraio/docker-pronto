FROM ruby:2.6.4-alpine3.10
MAINTAINER Eric Raio

# cmake is required by pronto
RUN set -ex && \
     apk update && \
     apk upgrade && \
     apk add \
     --no-cache \
     --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \cmake && \
     gem install -N pronto \
     # just list all the linters you are planning to use
     pronto-rubocop

CMD [ "irb" ]
