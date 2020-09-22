FROM srinitude/ruby:latest

SHELL ["/bin/bash", "-c"]

RUN set -ex \
    \
    && gem install bundler \
    && gem install rails 6.0.3
