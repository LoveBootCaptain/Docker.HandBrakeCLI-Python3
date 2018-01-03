FROM phusion/baseimage
MAINTAINER lovebootcaptain <@lovebootcaptain>

# setup ENV
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV PATH /scripts/:$PATH

# set and update repo
RUN sed -i 's#http://archive.ubuntu.com/#http://tw.archive.ubuntu.com/#' /etc/apt/sources.list
RUN apt-get update

# install built-in packages
RUN apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-dev \
        python3-setuptools \
        build-essential \
        locales

# setup locale for DE
RUN locale-gen de_DE.UTF-8

ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE:de
ENV LC_ALL de_DE.UTF-8
ENV TZ Europe/Berlin

# installing apps
RUN apt-get update && apt-get -y install \
	handbrake-cli \
	mkvtoolnix \
	gpac

# clean up
RUN apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# expose Volumes
RUN mkdir input output scripts

#set direcotries
WORKDIR /root

# set entrypoint
ENTRYPOINT bash