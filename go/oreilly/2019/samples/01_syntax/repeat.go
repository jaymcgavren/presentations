package main

import "fmt"

func main() {
	repeatLine("hello", 3)
}

func repeatLine(line string, times int) {
	for i := 0; i < times; i++ {
		fmt.Println(line)
	}
}
