+++
Categories = ["posts"]
Description = ""
Tags = ["binpacking"]
date = "2015-03-07T08:02:00-05:00"
menu = "main"
title = "Figuring out the size of objects to pack in bins"
draft = true
+++

Efficiently utilizing resources is one of the big issues to deal with when operating
servers, especially as the scale increases into hundreds, thousands or more. Projects
such as [Mesos](http://mesos.apache.org/) and [Kubernetes](http://kubernetes.io/)
aim to simplify the deployment of applications (or containers) onto a cluster. They
allow servers to be treated as one big pool of resources (CPU, Memory, Disk).

Mesos has slaves, a process that runs on each host. When a slave registers itself
with the master, it reports the total resources it has available (CPU, Memory, Disk).
This can be overridden via the command-line if necessary.

However, how do you determine how many resources to assign to a task? Should the
web server get 1 CPU share or 2? Should the database get 4GB of RAM, 16, more?

## what is bin packing
http://www.cs.arizona.edu/icon/oddsends/bpack/bpack.htm
http://www.slideshare.net/spodila/aws-reinvent-2014-talk-scheduling-using-apache-mesos-in-the-cloud

## problem
how do you figure out how big the things that will be packed in bins need to be?
For example in MEsos how do you decide 1 CPU or 2 CPU, memory, etc?
