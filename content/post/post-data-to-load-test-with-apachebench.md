---
title: "POST Data to Load Test with ApacheBench"
date: "2015-01-03"
description: "Example showing how to POST data to load test with ApacheBench."
categories:
- "posts"
tags:
- "apachebench"
- "load test"
- "http"
---

[ApacheBench](http://httpd.apache.org/docs/2.2/programs/ab.html) (also known as, ab) is,

> a tool for benchmarking your Apache Hypertext Transfer Protocol (HTTP) server

Don't be fooled, you can use it to benchmark any server that supports HTTP. In
fact, it might be worth checking out [boom](https://github.com/rakyll/boom) which
is written in [Go](http://golang.org) which makes it easier to use across platforms,
and is simple to install (spoiler alert: it's just a binary).

Anyhow, in this post I'll demonstrate using ApacheBench (since I came across it first).

If you look at the documentation for `ab` you'll see there a bunch of options.
The focus of this post is the `-p POST-file` option which lets you POST a
`File containing data to POST`.

Sounded simple, so I thought I'd give it a shot. I was trying to benchmark a form
submission. I thought maybe I could use use `-p my-awesome-data.tgz`, but it
wasn't quite that simple.

After some googling, I found that what I needed to do was submit a file that
looked like a form based file upload. Turns out [RFC1867](http://www.faqs.org/rfcs/rfc1867.html) was the ticket.
Here's an example, check out the RFC for more details.

```
--1234567890
Content-Disposition: form-data; filename="my-awesome-data.tgz"
Content-Type: application/octet-stream
Content-Transfer-Encoding: binary

<base64 data>
--1234567890
```

The boundary, `1234567890`, should be a value **guaranteed** not to appear in
the content of the request. The rest of the fields should be relatively simple
to understand. The `<base64 data>` portion must contain the base64 encoded
value of the file being uploaded.

Here's how you'd run a benchmark that submits 100 requests, with 5 concurrent
clients using a file named `post.txt` (which looks like the example shown above)
to `http://server.com/api/v1/data`

```
ab -n 100 -c 5 -T 'multipart/form-data; boundary=1234567890' -p post.txt http://server.com/api/v1/data
```

I'd like to try out boom, but the concepts are similar so I suspect it should be
just as easy.

Happy benchmarking!
