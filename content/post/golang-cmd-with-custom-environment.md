+++
Categories = ["posts"]
Description = ""
Tags = ["golang"]
date = "2015-02-24T21:51:56-05:00"
menu = "main"
title = "Go: command with custom environment"
draft = false
+++

Problem: Execute an external process with a customized environment.

Solution: The [Go by Example](https://gobyexample.com) site
has as an example demonstrating how to [spawn an external process](https://gobyexample.com/spawning-processes) and how [exec
a process](https://gobyexample.com/execing-processes). Those two examples provide
a great starting point. Below, we'll take it a step further to modify the
environment.

```
package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"os/exec"
)

// In this example `messageId` is a value that
// needs to be stored in an environment variable to be
// used by the command that's going to be executed
func doIt(messageId string) error {
	binary, err := exec.LookPath("print_env.sh")
	if err != nil {
		return err
	}

	cmd := exec.Command(binary)
	env := os.Environ()
	env = append(env, fmt.Sprintf("MESSAGE_ID=%s", messageId))
	cmd.Env = env

	cmdOut, _ := cmd.StdoutPipe()
	//cmdErr, _ := cmd.StderrPipe()

	startErr := cmd.Start()
	if startErr != nil {
		return startErr
	}

	// read stdout and stderr
	stdOutput, _ := ioutil.ReadAll(cmdOut)
	//errOutput, _ := ioutil.ReadAll(cmdErr)

	fmt.Printf("STDOUT: %s\n", stdOutput)
	//fmt.Printf("ERROUT: %s\n", errOutput)

	err = cmd.Wait()
	return err
}

func main() {
	messageId := "abc123"
	err := doIt(messageId)
	if err != nil {
		fmt.Printf("Error: %v\n", err)
	}
}
```

The `doIt` function is where the magic happens. First, a `exec.Command` is
created. Next, we grab a copy of the environment using `os.Environ()`. The
environment is a slice of strings so we append another string, in the correct
format, containing the environment variable we want to add, `MESSAGE_ID`.

The rest of the code sets up reading stdout (and stderr, though I commented )
and executing the command. If you run the program, you'll see in the output
that `MESSAGE_ID` was set to `abc123` (as passed into the `doIt` function).

Simple, right?
