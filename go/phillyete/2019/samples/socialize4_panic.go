package main

import (
	"fmt"
)

func Socialize() {
	fmt.Println("Hello!")
	panic("I need to get out of here!")
	// The below code won't be run!
	fmt.Println("Nice weather, eh?")
	fmt.Println("Goodbye!")
}

func main() {
	Socialize()
}
