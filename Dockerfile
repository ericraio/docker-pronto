FROM ruby:2.6.4
MAINTAINER Eric Raio

ENV HOME /root

# cmake is required by pronto
RUN apt-get update -y && \
     apt-get install -y \
     cmake curl libsnappy-dev autoconf automake libtool pkg-config git sudo \
     && \
     gem install -N pronto \
     # just list all the linters you are planning to use
     pronto-rubocop
     
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

USER docker

WORKDIR $HOME
RUN git clone https://github.com/openvenues/libpostal
WORKDIR /libpostal
COPY ./build_libpostal.sh .
RUN ./build_libpostal.sh

CMD [ "irb" ]
