# fluentd

Collect your logging data with [fluentd].

There are 3 primary types of nodes:
 * Collectors - Exist beside the service to collect and forward its log data.
 * Routers - Get data from collectors and forward them to correct publishers.
 * Publishers - Do something meaningful with the data (e.g. store to database).

## Collectors

### HTTP

The HTTP collector provides an API endpoint to send event data. This endpoint is secure, may require authentication, etc.

### Docker/Kubernetes

These collectors run alongside your containers and collect their logging information. They also provide an HTTP endpoint for your containers, but this endpoint is unauthenticated and available only to your containers.??

## Router

There is only a single router (for which there may be many instances) that is responsible for forwarding events to the right place.

## Publishers

### Archive

The archiver simply packages up logs in blob format, compresses them and sends them to blob storage.

### ElasticSearch

Send data to elasticsearch for use with kibana.


Possible: nodejs "server" that accepts forwarded packets. Use for things like analytics clients to do their own thing with the data.
https://gist.github.com/kawanet/078e274952638fd53150
https://www.digitalocean.com/community/tutorials/how-to-use-confd-and-etcd-to-dynamically-reconfigure-services-in-coreos
