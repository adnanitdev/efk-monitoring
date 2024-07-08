#!/bin/bash

# Install Elasticsearch and Kibana
kubectl create ns efk
helm install elasticsearch elastic/elasticsearch --version 7.17.3 -n efk --set replicas=1
helm install kibana elastic/kibana --version 7.17.3 -n efk


# Apply Fluentd 
echo "deploying fluentd"
kubectl apply -f ./fluentd-configmap.yaml
kubectl apply -f ./fluentd-daemonset.yaml
