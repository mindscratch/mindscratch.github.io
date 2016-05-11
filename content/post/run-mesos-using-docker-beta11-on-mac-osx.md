+++
Categories = ["posts"]
Description = "Run Mesos using Docker 1.11-beta11 on Mac OS X"
Tags = ["docker", "mesos", "mac"]
date = "2016-05-11T19:37:37-04:00"
menu = "main"
title = "Run Mesos using Docker 1.11.1-beta11 on Mac OS X"
draft = false
+++

Previously I [wrote about]({{< relref "post/run-mesos-using-docker-beta-on-mac-osx.md" >}}) running [Apache Mesos](http://mesos.apache.org)
in Docker on Mac OS X using Docker for Mac Beta 8. With the recent update to
Docker 1.11.1-beta11 things have changed a bit and so the scripts have to change.

Once again the `dockerIp` had to be discovered differently and I had to switch
docker to use `nat` networking, instead of the default `hostnet`.

First, change the networking: `pinata set network nat`. Now, create a script
to help start mesos once inside the container.

## Start Mesos Master

First create a script used to prep and launch `mesos-master`.

### run_mesos_master.sh

```
#!/bin/bash

dockerIp=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')

echo; echo "DOCKER IP: $dockerIp; echo; echo"

exec MESOS_HOSTNAME=$dockerIp MESOS_IP=$dockerIp mesos-master
```

### start_mesos_master.sh

```
#!/bin/bash

hostIp=$(ipconfig getifaddr en0)

docker run \
-e MESOS_QUORUM=1 \
-e MESOS_ZK=zk://$hostIp:2181/mesos \
-e MESOS_REGISTRY=in_memory \
-v $(pwd):/scripts \
--name mesos-master \
--net=host \
--entrypoint /bin/bash \
mesosphere/mesos-master:0.28.0-2.0.16.ubuntu1404 \
/scripts/run_mesos_master.sh
```

Now run `start_mesos_master.sh` to start the master.

## Start Mesos slave

Create a separate script to prep and launch the `mesos-slave`.

### run_mesos_slave.sh

```
#!/bin/bash

dockerIp=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')

exec MESOS_HOSTNAME=$dockerIp MESOS_IP=$dockerIp mesos-slave
```

### start_mesos_slave.sh

```
#!/bin/bash

hostIp=$(ipconfig getifaddr en0)

docker run \
-e MESOS_MASTER=zk://$hostIp:2181/mesos \
-v $(pwd):/scripts \
-v /sys/fs/cgroup:/sys/fs/cgroup \
-v /var/run/docker.sock:/var/run/docker.sock \
--name slave --net=host --privileged --restart always \
--entrypoint /bin/bash \
mesosphere/mesos-slave:0.28.0-2.0.16.ubuntu1404 \
/scripts/run_mesos_slave.sh
```

Now run `start_mesos_slave.sh` to start the slave.

Browse to the IP address output when starting the mesos master.
