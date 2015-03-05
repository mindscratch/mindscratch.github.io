---
title: "Starting a new Go project"
date: "2014-12-09"
description: "Notes related to starting a new Go project."
categories:
    - "posts"
tags:
    - "golang"
---

I have the need for a program that can monitor Kubernetes* for services* and update an HAProxy* configuration file when changes occur. Sounds rather simple, however, there's a slight twist. I don't want to simply add entries to HAProxy for each service created in Kubernetes (it also wouldn't work as multiple services in Kubernetes could have the same port, since each service has its own IP address).

Instead I need a way to define a set of rules, perhaps as simple as a template, that will be used to update the HAProxy configuration file intelligently.

The template spec:

```go
type ServiceEntry struct {
    Name string `json:"name,omitempty"`
    Port int `json:"port,omitempty"`
    Uri string `json:"uri,omitempty"`
}

type ServiceEntries []ServiceEntry {}
```

```
services:
    # accessible as http://<proxy ip>:9200
    # the name of the service to monitor
    - name: elasticsearch
    # the port on the proxy for the service
      port: 9200
    # the uri on the proxy for the service
      uri: /
    # accessible as http://<proxy ip>/kibana
    - name: kibana
      port: 80
      uri: /kibana
```

To be continued...

### Resources
* [Kubernetes](https://github.com/GoogleCloudPlatform/kubernetes/)
* [Kubernetes services](https://github.com/GoogleCloudPlatform/kubernetes/blob/master/docs/services.md)
* [HAProxy](http://www.haproxy.org/)
* [GithubCodeLayout](https://code.google.com/p/go-wiki/wiki/GithubCodeLayout)
