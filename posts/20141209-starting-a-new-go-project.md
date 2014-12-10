# Starting a new Go project

I have the need for a program that can monitor Kubernetes* for services* and update an HAProxy* configuration file when changes occur. Sounds rather simple, however, there's a slight twist. I don't want to simply add entries to HAProxy for each service created in Kubernetes (it also wouldn't work as multiple services in Kubernetes could have the same port, since each service has its own IP address).

Instead I need a way to define a set of rules, perhaps as simple as a template, that will be used to update the HAProxy configuration file intelligently.

To be continued...

### Resources
* [Kubernetes](https://github.com/GoogleCloudPlatform/kubernetes/)
* [Kubernetes services](https://github.com/GoogleCloudPlatform/kubernetes/blob/master/docs/services.md)
* [HAProxy](http://www.haproxy.org/)
* [GithubCodeLayout](https://code.google.com/p/go-wiki/wiki/GithubCodeLayout)

