package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
)

func PrintLines(fileName string) error {
	file, err := os.Open(fileName)
	if err != nil {
		return err
	}
	defer file.Close()
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		fmt.Println(scanner.Text())
	}
	if scanner.Err() != nil {
		return scanner.Err()
	}
	return nil
}

func main() {
	err := PrintLines("lorem_ipsum.txt")
	if err != nil {
		log.Fatal(err)
	}
}
