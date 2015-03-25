+++
Categories = ["posts"]
Description = "Mesos 0.22.0 Release"
Tags = ["mesos"]
date = "2015-03-24T20:33:36-05:00"
menu = "main"
title = "Mesos 0.22.0 Release"
draft = false
+++

[Mesos](http://mesos.apache.org/) 0.22.0 has been [released](https://dist.apache.org/repos/dist/release/mesos/0.22.0/)!

There's a nice [video](https://www.youtube.com/watch?v=LC3dlmdc4bc) which goes through the new features in 0.22.0 as well as
some features scheduled for the 0.23.0 release.

I've put together some notes I put together while watching the video.

## Disk Isolation

[Disk Isolation](https://issues.apache.org/jira/browse/MESOS-1589) allows the
`MesosContainerizer` to enforce a disk quota. Prior to 0.22.0 mesos supported [isolation](https://youtu.be/LC3dlmdc4bc?t=207) of cpu, memory, pid namespacing,
network ports and bandwidth.

To use this new isolation, two new flags are required:

```
# enable disk isolation
--isolation=“posix/disk” --enforce_container_disk_quota

# set the quota, in megabytes
-—resources=“disk:64”
```

## Disaster Prevention

There are [several mechanisms](https://youtu.be/LC3dlmdc4bc?t=503) to prevent
disaster that were in place prior to the 0.22.0 release:

- master commits suicide when losing connection to ZK
- compute nodes ignore shutdown requests received from master that is not leader
— recovery remove limit (% of cluster)

In this release the ability to [rate limit slave removal](https://issues.apache.org/jira/browse/MESOS-1148)
was added which could allow administrators to react when they notice the
slave removals occurring.

To configure the rate limit, a new flag is available:

```
# remove one slave per minute
--slave_removal_rate_limit=1/1mins
```

## Labels and Discovery

Tasks can now have [labels](https://github.com/apache/mesos/blob/b2f73095fd168a75c2754f26d5368f4cff414752/include/mesos/mesos.proto#L1056), which are simply key/value pairs. This allows tasks to be tagged, for example `environment: production`.

Additionally, tasks can now include [DiscoveryInfo](https://github.com/apache/mesos/blob/b2f73095fd168a75c2754f26d5368f4cff414752/include/mesos/mesos.proto#L1093). This information can be used for service discovery as it can provide
common attributes such as `environment`, `location` and `version`. However, it
also supports [Ports](https://github.com/apache/mesos/blob/b2f73095fd168a75c2754f26d5368f4cff414752/include/mesos/mesos.proto#L1075) (which can have names), as well as arbitrary labels.

Video link: https://youtu.be/LC3dlmdc4bc?t=600
d168a75c2754f26d5368f4cff414752/include/mesos/mesos.proto#L1093

## More features and improvements

There are other features and improvements which are highlighted in the video.
I imagine the mesos website will be updated soon with a summary as well.

## What to look forward to

With a release being published within the hour, naturally it's time to look at
what's coming next:

* [persistent primitives](https://issues.apache.org/jira/browse/MESOS-1554) - to
support storage-like services
* [dynamic reservations](https://issues.apache.org/jira/browse/MESOS-2018) - allow a
framework to dynamically reserve offered resources, allowing those resources to
only be re-offered to the same framework (to support stateful services)
* [ssl support](https://issues.apache.org/jira/browse/MESOS-910)
* [optimistic offers](https://issues.apache.org/jira/browse/MESOS-1607) - resource offers
are currently offered to a single framework at a time, with optimistic offers the
offers would be handed out in parallel.

Again, there's other features, improvements and bug fixes slated for Mesos 0.23.0
but this should at least give a taste for what's to come.
