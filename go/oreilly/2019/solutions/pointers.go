package main

import "fmt"

func negate(myBoolean *bool) {
	*myBoolean = !*myBoolean
}

func main() {
	truth := true
	negate(&truth)
	fmt.Println(truth) // => false
	lies := false
	negate(&lies)
	fmt.Println(lies) // => true
}
