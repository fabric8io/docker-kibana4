FROM debian:wheezy

MAINTAINER Jimmi Dyson <jimmidyson@gmail.com>

ENV KIBANA_VERSION 4.0.0

RUN apt-get update && apt-get install -y wget ca-certificates && rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://download.elasticsearch.org/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz | tar xzv -C /opt && \
    ln -s /opt/kibana* /opt/kibana4

ADD run.sh /run.sh

CMD ["/run.sh"]
