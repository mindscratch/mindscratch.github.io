+++
categories = ["posts"]
Tags = ["docker", "containers", "hyper.sh"]
date = "2016-01-18T20:32:45-05:00"
title = "hypersh on mac"
menu = "main"
+++

[Hyper](https://hyper.sh/) calls itself a `Hypervisor-agnostic Docker Runtime`.
It boasts the [benefits](https://hyper.sh/why-hyper.html) of Virtual Machines and Containers, without the downsides:

* security
  * using a VM reduces the attach surface and avoids the "shared kernel" problem
  presented by containers.
* performance
  * Hyper is able to launch instances in sub-second versus tens of seconds like
  traditional VM's.
* portable
  * the hypervisor is agnostic, it supports KVM, Xen and VirtualBox.
* immutable

It's also nice to see their following the [OCI Specs](https://github.com/opencontainers/specs)
for their [hypervisor](https://github.com/hyperhq/runv).

Hyper supports Mac OS X, however, due to recent changes in the OS, VirtualBox doesn't
work well, so [Hyper doesn't currently work with Mac OS X 10.11 (El Capitan)](https://github.com/hyperhq/hyper/issues/182).

I look forward to trying out Hyper on my laptop, I'll probably give it a whirl
on [Packet](https://www.packet.net/promo/hyper/).
