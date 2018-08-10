FROM debian:jessie
LABEL maintainer "code@softinio.com"

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils python python-pip ca-certificates git
RUN rm -rf /var/lib/apt/lists/*
RUN pip install awscli

ENV HUGO_VERSION 0.46
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb && rm /tmp/hugo.deb

