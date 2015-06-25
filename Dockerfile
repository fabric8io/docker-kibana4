FROM centos:7
MAINTAINER Jimmi Dyson <jimmidyson@gmail.com>
CMD ["/run.sh"]

ENV KIBANA_VERSION 4.1.0

RUN curl https://download.elasticsearch.org/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz | tar xzv -C /opt && \
    ln -s /opt/kibana* /opt/kibana4 && \
    chmod 777 /opt/kibana4/config/ && \
    chmod 666 /opt/kibana4/config/kibana.yml

ADD run.sh /run.sh

USER nobody
