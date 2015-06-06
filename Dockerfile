FROM centos:7
MAINTAINER Jimmi Dyson <jimmidyson@gmail.com>
CMD ["/run.sh"]

ENV DEBIAN_FRONTEND noninteractive
ENV KIBANA_VERSION 4.0.1

RUN yum install -y tar && yum clean all

RUN curl https://download.elasticsearch.org/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz | tar xzv -C /opt && \
    ln -s /opt/kibana* /opt/kibana4 && \
    chown nobody:nobody /opt/kibana4/config/ /opt/kibana4/config/kibana.yml

ADD run.sh /run.sh

USER nobody
