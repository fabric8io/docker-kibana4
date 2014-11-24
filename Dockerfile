FROM debian:wheezy

MAINTAINER Jimmi Dyson <jimmidyson@gmail.com>

RUN apt-get update && apt-get install -y wget openjdk-7-jre-headless && rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-BETA2.tar.gz | tar xzv -C /opt && \
    ln -s /opt/kibana* /opt/kibana4

ADD run.sh /run.sh

CMD ["/run.sh"]
