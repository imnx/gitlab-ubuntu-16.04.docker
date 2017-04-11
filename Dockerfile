FROM ubuntu:16.04
MAINTAINER imnx.au@outlook.com

COPY scripts/update-sources-list.sh /usr/bin/
RUN echo 'deb http://mirror.internode.on.net/pub/ubuntu/ubuntu/ xenial main restricted universe multiverse' > /etc/apt/sources.list
RUN echo 'deb http://mirror.internode.on.net/pub/ubuntu/ubuntu/ xenial-updates main restricted universe multiverse' >> /etc/apt/sourses.list
RUN echo 'deb http://mirror.internode.on.net/pub/ubuntu/ubuntu/ xenial-backports main restricted universe multiverse' >> /etc/apt/sourses.list
RUN echo 'deb http://mirror.internode.on.net/pub/ubuntu/ubuntu/ xenial-security main restricted universe multiverse' >> /etc/apt/sourses.list
RUN apt-get -yq update

RUN apt-get -qy install perl-base curl wget bash nano sudo apt-utils dnsutils psmisc tzdata locales dialog pv mc
RUN echo 'imnx ALL=NOPASSWD:ALL' > /etc/sudoers.d/myOverrides
RUN adduser imnx --home /home/imnx --shell /bin/bash --ingroup sudo --system --force-badname
RUN apt-get -qy install build-essential git subversion mercurial automake autoconf autotools-dev nasm bison flex libtool
RUN apt-get -qy dist-upgrade

RUN apt-get -qy install mysql-server
RUN apt-get -qy install gitlab

CMD /bin/bash
