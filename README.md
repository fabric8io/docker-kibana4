# Kibana4 Docker image

To configure the Elasticsearch URL pass in the environment variable `ELASTICSEARCH_URL`:

    docker run -d -p 5601:5601 -e ELASTICSEARCH_URL=http://192.168.1.1:9200 fabric8/kibana4:latest

If you’re running this under Kubernetes or OpenShift 3 then you can specify the Kubernetes
service name via the `ELASTICSEARCH_SERVICE_NAME` environment variable instead - this will need to be in
your Kubernetes config:

```yaml
apiVersion: v1beta1
  kind: Config
  id: kibana-config
  items:
    - apiVersion: v1beta1
      kind: Pod
      id: kibana-pod
      desiredState:
        manifest:
          version: v1beta1
          id: kibana-server
          containers:
            - name: kibana-image
              image: fabric8/kibana4:latest
              ports:
                - name: kibana-port
                  containerPort: 5601
              env:
                - name: ELASTICSEARCH_SERVICE_NAME
                  value: ELASTICSEARCH
      labels:
        app: kibana-viewer
    - apiVersion: v1beta1
      kind: Service
      id: kibana-service
      containerPort: kibana-port
      port: 5601
      selector:
        app: kibana-viewer
```

You will then be able to hit Kibana by localhost:5601
