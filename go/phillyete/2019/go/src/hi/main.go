package main

import (
	"greeting"
	"greeting/dansk"
	"greeting/deutsch"
)

func main() {
	greeting.Hello()   // => Hello!
	dansk.Hej()        // => Hej!
	deutsch.GutenTag() // => Guten Tag!
}
