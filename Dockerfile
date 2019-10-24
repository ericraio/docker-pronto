FROM ruby:2.4
MAINTAINER Eric Raio

# cmake is required by pronto
RUN apt-get update -y && \
      apt-get install -y cmake && \
      gem install -N pronto \
      # just list all the linters you are planning to use
      pronto-rubocop \
      pronto-rails_best_practices \
      pronto-brakeman \
      pronto-rails_schema

CMD [ "irb" ]
