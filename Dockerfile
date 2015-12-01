FROM ruby:2.3.0-slim
MAINTAINER Liam Norton

WORKDIR /toy-robot-ruby

COPY Gemfile* ./

RUN bundle install

ADD . .

CMD ["bin/toy-robot"]
