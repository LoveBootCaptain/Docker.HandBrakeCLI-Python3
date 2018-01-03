FROM phusion/baseimage
MAINTAINER lovebootcaptain <@lovebootcaptain>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV PATH /scripts/:$PATH

RUN sed -i 's#http://archive.ubuntu.com/#http://tw.archive.ubuntu.com/#' /etc/apt/sources.list

# Installing apps
RUN add-apt-repository ppa:stebbins/handbrake-releases
RUN apt-get update && apt-get -y install \
	handbrake-cli \
	mkvtoolnix \
	gpac

# built-in packages
RUN apt-get update \
    && apt-get install -y --force-yes --no-install-recommends software-properties-common curl \
    && sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list" \
    && curl -SL http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key | sudo apt-key add - \
    && add-apt-repository ppa:fcwu-tw/ppa \
    && apt-get update \
    && apt-get install -y --force-yes --no-install-recommends \
        python3 python3-pip python3-dev build-essential \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bash"]

# Expose Volumes
VOLUME /input /output /scripts

WORKDIR /root