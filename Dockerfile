FROM ruby:2.6.4
MAINTAINER Eric Raio

# cmake is required by pronto
RUN apt-get update -y && \
     apt-get install -y \
     cmake curl libsnappy-dev autoconf automake libtool pkg-config git \
     && \
     gem install -N pronto \
     # just list all the linters you are planning to use
     pronto-rubocop

WORKDIR /
RUN git clone https://github.com/openvenues/libpostal
WORKDIR /libpostal
COPY ./build_libpostal.sh .
RUN ./build_libpostal.sh

CMD [ "irb" ]
