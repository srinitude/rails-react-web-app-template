FROM srinitude/ruby:latest

SHELL ["/bin/bash", "-c"]

RUN set -ex \
    \
    && apt install -y sudo \
    && curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
    && apt -y update \
    && apt install -y --no-install-recommends \
        nodejs \
        yarn \
        postgresql \ 
        postgresql-contrib \
    \
    && node -v \
    && yarn --version \
    && gem install bundler
