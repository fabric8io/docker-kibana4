#!/bin/bash

if [[ -n "${ELASTICSEARCH_URL}" ]]; then
    sed -i 's|^\(# \+\)\?elasticsearch\.url:.*$|elasticsearch.url: '"\"${ELASTICSEARCH_URL}\""'|' /opt/kibana4/config/kibana.yml
elif [[ -n "${ELASTICSEARCH_SERVICE_NAME}" ]]; then
    SVC_HOST=${ELASTICSEARCH_SERVICE_NAME}_SERVICE_HOST
    SVC_PORT=${ELASTICSEARCH_SERVICE_NAME}_SERVICE_PORT
    sed -i 's|^\(# \+\)\?elasticsearch\.url:.*$|elasticsearch.url: '"\"http://${!SVC_HOST}:${!SVC_PORT}\""'|' /opt/kibana4/config/kibana.yml
fi

exec /opt/kibana4/bin/kibana
