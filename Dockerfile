FROM ruby:2.6.4
MAINTAINER Eric Raio

ENV DEBIAN_FRONTEND     noninteractive
ENV LIBPOSTAL_VERSION   v1.0.0
ENV LIBPOSTAL_DIR       /opt/libpostal
ENV LIBPOSTAL_DATA_DIR  /opt/libpostal_data

# cmake is required by pronto
RUN apt-get update && apt-get -qq update && apt-get install -y --force-yes \
  cmake \
  libsnappy-dev \
  autoconf \
  automake \
  libtool \
  pkg-config \
  git \
  && \
  gem install -N pronto \
  # just list all the linters you are planning to use
  pronto-rubocop

########################################
# libpostal
########################################
RUN wget https://github.com/openvenues/libpostal/archive/$LIBPOSTAL_VERSION.tar.gz
RUN mkdir -p $LIBPOSTAL_DIR
RUN tar -xvzf $LIBPOSTAL_VERSION.tar.gz -C $LIBPOSTAL_DIR --strip 1
WORKDIR $LIBPOSTAL_DIR
COPY ./build_libpostal.sh .
RUN ["chmod", "+x", "./build_libpostal.sh"]
RUN ./build_libpostal.sh

CMD [ "irb" ]
