FROM alpine:edge
MAINTAINER izaak.schroeder@gmail.com

# Grab the latest packages
RUN apk update

# SSL stuff
RUN apk add ca-certificates

# Ruby
RUN apk add ruby ruby-bundler ruby-dev
RUN rm -fr /usr/share/ri

# Go
RUN apk add curl git mercurial bzr go
ENV GOROOT /usr/lib/go
ENV GOPATH /gopath
ENV GOBIN /gopath/bin
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

# Delete cache
RUN rm -rf /var/cache/apk/*

# fluentd
RUN mkdir -p /fluentd/log
RUN mkdir -p /fluentd/etc
RUN mkdir -p /fluentd/plugins

RUN gem install fluentd -v 0.14.0.pre.1

ENV FLUENTD_OPT=""
ENV FLUENTD_CONF="fluent.conf"

# RUN go get --tags $CONFD_VERSION -u github.com/kelseyhightower/confd

CMD exec fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
