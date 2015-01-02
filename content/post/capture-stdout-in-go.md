---
title: "Capture STDOUT in Go"
date: "2015-01-02"
description: "Simple example demonstrating how to capture STDOUT in Go."
categories:
    - "posts"
tags:
    - "golang"
---

Capturing output written to STDOUT (standard output) can be accomplished
with the following code.

```
import (
  "bytes"
  "io"
  "os"
)

// not thread safe
func captureStdout(f func()) string {
  old := os.Stdout
  r, w, _ := os.Pipe()
  os.Stdout = w

  f()

  w.Close()
  os.Stdout = old

  var buf bytes.Buffer
  io.Copy(&buf, r)
  return buf.String()
}
```

The code here is fairly straight forward. First, a reference to the `Writer`
that's assigned to `os.Stdout` is stashed for later. Next a [Pipe](http://golang.org/pkg/os/#Pipe) is created,
which provides a connected pair of Files. The writer created by the Pipe is
assigned to `os.Stdout`. Perhaps you can see where this is going.

Next, we invoke the function provided to `captureStdout`. The writer is closed
and `os.Stdout` gets the original `Writer` assigned back to it.

The final steps are to copy the data from the reader, created from the Pipe,
and return the string as the result.

You should note, this code is **not thread safe**. Why? Because of that
*global* reference, `os.Stdout`.

An example using it would look something like this:

```
func doSomething() {
  fmt.Println("This goes to STDOUT")
}

func example() {

  // invoke doSomething and return whatever it writes to STDOUT
  message := captureStdout(doSomething)

}
```

The example shown is trivial. I had a use case where I had to execute an
executable on the system that wrote data to STDOUT which I needed to process.
