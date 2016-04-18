+++
Categories = ["posts"]
Description = "Run Mesos using Docker Beta on Mac OS X"
Tags = ["docker", "mesos", "mac"]
date = "2016-04-17T20:30:55-04:00"
menu = "main"
title = "Run Mesos using Docker Beta on Mac OS X"
draft = false
+++

Previously I [wrote about]({{< relref "post/mesos-on-mac-osx.md" >}}) running [Apache Mesos](http://mesos.apache.org)
in Docker on Mac OS X. Back then Docker worked by using a VM run via VirtualBox. Today,
using Docker Beta for Mac, the process is simpler and more like the linux experience.

The scripts I used before only had to be changed to update the way the `dockerIp`
was discovered. I wasn't sure how do find that IP address.

With the Docker Beta there's a command-line tool named `pinata`
which can be used to configure docker:

```
laptop:~ craig$ pinata list
These are advanced configuration settings to customise Docker.app on MacOSX.
You can set them via pinata set <key> <value> <options>.

🐳  hostname = docker
   Hostname of the virtual machine endpoint, where container ports will be
   exposed if using nat networking. Access it via 'docker.local'.

🐳  hypervisor = native (memory=2, ncpu=4)
   The Docker.app includes embedded hypervisors that run the virtual machines
   that power the containers. This setting allows you to control which the
   default one used for Linux is.

 ▸  native: a version of the xhyve hypervisor that uses the MacOSX
              Hypervisor.framework to run container VMs. Parameters:
              memory (VM memory in gigabytes), ncpu (vCPUs)


🐳  network = nat (external-bind=false)
   Controls how local containers can access the external network via the
   MacOS X host. This includes outbound traffic as well as publishing ports
   for external access to the local containers.

 ▸     nat: a mode that uses the MacOS X vmnet.framework to route container
              traffic to the host network via a NAT. Parameters:
              external-bind (bind ports to external network interface)
 ▸ hostnet: a mode that helps if you are using a VPN that restricts
              connectivity. Activating this mode will proxy container network
              packets via the Docker.app process as host socket traffic.
              Parameters: docker-ipv4 (docker node), host-ipv4 (host node)

🐳  filesystem = osxfs
   Controls the mode by which files from the MacOS X host and the container
   filesystem are shared with each other.

 ▸   osxfs: a FUSE-based filesystem that bidirectionally forwards OSX
              filesystem events into the container.


🐳  daemon = run 'pinata get daemon' or 'pinata set daemon [@file|-]>
   JSON configuration of the local Docker daemon. Configure any custom
   options you need as documented in:
   https://docs.docker.com/engine/reference/commandline/daemon/. Set it
   directly, or a @file or - for stdin.
```

The `hostname` property says you can access the virtual machine endpoint through
`docker.local`. I tried to ping that hostname and received "request timed out". From what I render
in the forums, I should've gotten a response. I rebooted my Mac and tried the ping again:

```
laptop:~ craig$ ping docker.local
PING docker.local (192.168.64.4): 56 data bytes
64 bytes from 192.168.64.4: icmp_seq=0 ttl=64 time=0.361 ms
64 bytes from 192.168.64.4: icmp_seq=1 ttl=64 time=0.382 ms
^C
--- docker.local ping statistics ---
2 packets transmitted, 2 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 0.361/0.371/0.382/0.010 ms
```

It worked! Here's the updated scripts I used to start a Mesos master and slave
using Docker Beta for Mac:

## Start Mesos master

```
#!/bin/bash

# there must be a simpler way...
dockerIp=$(ping -c 1 docker.local  | grep "^PING docker.local" | gawk '{print $3}' | tr -d '(' | tr -d ')' | tr -d ':')
hostIp=$(ipconfig getifaddr en0)

docker run \
-e MESOS_HOSTNAME=$dockerIp \
-e MESOS_IP=$dockerIp \
-e MESOS_QUORUM=1 \
-e MESOS_ZK=zk://$hostIp:2181/mesos \
--name mesos-master \
--net host \
--restart always \
mesosphere/mesos-master:0.28.0-2.0.16.ubuntu1404
```

## Start Mesos slave

```
#!/bin/bash

# there must be a simpler way...
dockerIp=$(ping -c 1 docker.local  | grep "^PING docker.local" | gawk '{print $3}' | tr -d '(' | tr -d ')' | tr -d ':')
hostIp=$(ipconfig getifaddr en0)

docker run \
-e MESOS_HOSTNAME=$dockerIp \
-e MESOS_IP=$dockerIp \
-e MESOS_MASTER=zk://$hostIp:2181/mesos \
-v /sys/fs/cgroup:/sys/fs/cgroup \
-v /var/run/docker.sock:/var/run/docker.sock \
--name slave --net host --privileged --restart always \
mesosphere/mesos-slave:0.28.0-2.0.16.ubuntu1404
```
