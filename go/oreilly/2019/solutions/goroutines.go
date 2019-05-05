// This program should call the "repeat" function twice, using two
// separate goroutines. The first goroutine should print the string
// "x" repeatedly, and the second goroutine should print "y"
// repeatedly. You'll also need to create a channel that carries
// boolean values to pass to "repeat", so the goroutine can signal
// when it's done.
//
// Output will vary, but here's one possible result:
// yyyyyyyyyyyyyyyyyyyyxxxxxxxxxxxxxxxxxxxxxyyyyyyyyyxxxxxxxxxy
//
// Replace the blanks ("____") in the code so the program will
// compile and run.
package main

import "fmt"

// repeat prints a string multiple times, then writes "true" to the
// provided channel to signal it's done.
func repeat(s string, channel chan bool) {
	for i := 0; i < 30; i++ {
		fmt.Print(s)
	}
	channel <- true
}

func main() {
	channel := make(chan bool)
	go repeat("x", channel)
	go repeat("y", channel)
	<-channel
	<-channel
}
