# efk-monitoring
A repository to deploy EFK stack for monitoring in kubernetes

Just download the repository and run `install.sh` script and you should be able to deploy the efk stack on to your kubernetes cluster.

The current configuration of fluentd is desgined to collect all the k8s logs and works as centralized logging system.

Elasticsearch and Kibana are deployed in `efk` namespace

Fluentd daemonset is deployed in `kube-system` namespace.

To verify if logs are being ingested in to Elasticsearch you can either access the Kibana UI by exposing the kibana service to NodePort/LoadBalancer or you can verify by doing an API request to elasticsearch.  

`curl -X GET "http://<ELASTICSEARCH_HOST>:<ELASTICSEARCH_PORT>/_cat/indices?v"`

This command will provide a list of all indices, allowing you to verify the existence of the `centralizedlogging-*` index  which was configured through a configmap of fluentd.  

You can also fetch the logs from specific index. For example:

`curl -X GET "http://<ELASTICSEARCH_HOST>:<ELASTICSEARCH_PORT>/centralizedlogging-2024.06.26/_search?pretty"`
