FROM ubuntu:focal

ENV TZ America/New_York
ENV DEBIAN_FRONTEND noninteractive
SHELL ["/bin/bash", "-c"]

RUN chsh -s /bin/bash
RUN DEBIAN_FRONTEND=noninteractive \
    TZ=America/New_York \
    set -ex \
	\
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
        git \
        curl \
        emacs \
        ca-certificates \
        autoconf \
        bison \
        build-essential \
        libssl-dev \
        libyaml-dev \
        libreadline6-dev \
        zlib1g-dev \
        libncurses5-dev \
        libffi-dev \
        libgdbm6 \
        libgdbm-dev \
        libdb-dev \
        libpq-dev \
        tcl \
        tzdata \
        wget \
        ruby-full \
        rbenv \
	 \
    && mkdir /usr/local/share/ca-certificates/cacert.org \
    && wget -P /usr/local/share/ca-certificates/cacert.org http://www.cacert.org/certs/root.crt http://www.cacert.org/certs/class3.crt \
    && update-ca-certificates \
    && echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc \
    && echo 'eval "$(rbenv init -)"' >> ~/.bashrc \
    && source ~/.bashrc \
    && mkdir -p "$(rbenv root)"/plugins \
    && git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build \
    && rbenv install 2.7.1 \
    && rbenv rehash \
    && rbenv global 2.7.1


CMD [ "bash" ]
