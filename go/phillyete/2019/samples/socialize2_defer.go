package main

import "fmt"

func Socialize() {
	// This call will be made when Socialize ends.
	defer fmt.Println("Goodbye!")
	fmt.Println("Hello!")
	fmt.Println("Nice weather, eh?")
}

func main() {
	Socialize()
}
