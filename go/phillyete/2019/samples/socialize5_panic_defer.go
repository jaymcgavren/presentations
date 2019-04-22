package main

import (
	"fmt"
)

func Socialize() {
	defer fmt.Println("Goodbye!")
	fmt.Println("Hello!")
	panic("I need to get out of here!")
	// The below code won't be run!
	fmt.Println("Nice weather, eh?")
}

func main() {
	Socialize()
}
