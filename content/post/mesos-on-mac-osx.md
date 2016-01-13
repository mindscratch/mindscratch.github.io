+++
Categories = ["posts"]
Description = "Run Mesos on Mac OS X"
Tags = ["mesos", "mac"]
date = "2016-01-09T12:14:56-05:00"
menu = "main"
title = "Mesos on Mac OS X"
draft = false
+++

Using docker it's simple to get a [Mesos](mesos.apache.org) cluster running on Mac OS X. I'm running Docker 1.9.1
and OS X 10.11.2. We'll be running Zookeeper 3.4.7 and Mesos 0.24.1 (that's the version provided by the docker image I'm using for this example).

 First we'll start a Zookeeper server, then a Mesos master and
a single Mesos slave.

__note__: I have satellite internet, so my downloads are throttled after I use the data allowance for the month. I was able to pull a Docker images for Mesos but I kept having issues pulling the Zookeeper so I just downloaded Zookeeper from their [website](zookeeper.apache.org).

## Zookeeper

After downloading the zookeeper tarball, extract it. Copy the sample configuration file, `cp /path/to/zookeeper-3.4.7/conf/zoo_sample.cfg /path/to/zookeeper-3.4.7/zoo.cfg`. For now, the default configuration is good enough.

Start the server: `/path/to/zookeeper-3.4.7/bin/zkServer.sh`

## Start Mesos master

On the Mac, Docker is run in a VM, so we have to do some finagling to get the correect IP address for Mesos to use. To start the Mesos master I created a small script:

```
#!/bin/bash

dockerIp=$(echo $DOCKER_HOST | cut -d '/' -f 3 | cut -d ':' -f 1)
hostIp=$(ipconfig getifaddr en0)

docker run \
-e MESOS_HOSTNAME=$dockerIp \
-e MESOS_IP=$dockerIp \
-e MESOS_QUORUM=1 \
-e MESOS_ZK=zk://$hostIp:2181/mesos \
--name mesos-master \
--net host \
--restart always \
mesoscloud/mesos-master
```

_note_: You could optionally pass the `-d` flag so the container would run in the background.

## Start Mesos slave

I also used a script to start the Mesos slave:

```
#!/bin/bash

dockerIp=$(echo $DOCKER_HOST | cut -d '/' -f 3 | cut -d ':' -f 1)
hostIp=$(ipconfig getifaddr en0)

docker run \
-e MESOS_HOSTNAME=$dockerIp \
-e MESOS_IP=$dockerIp \
-e MESOS_MASTER=zk://$hostIp:2181/mesos \
-v /sys/fs/cgroup:/sys/fs/cgroup \
-v /var/run/docker.sock:/var/run/docker.sock \
--name slave --net host --privileged --restart always \
mesoscloud/mesos-slave
```

You can now browse to the Mesos UI. You'll need to get the IP address of the VM running docker:

```
bash-3.2$ echo $DOCKER_HOST
tcp://192.168.99.100:2376
```

In this case, browse to `http://192.168.99.100:5050`.
