package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"time"
)

func responseSize(url string) {
	fmt.Println("Getting", url)
	// Note: errors ignored with _!
	response, _ := http.Get(url)
	defer response.Body.Close()
	body, _ := ioutil.ReadAll(response.Body)
	fmt.Println(len(body))
}

func main() {
	start := time.Now()
	responseSize("https://example.com/")
	responseSize("https://golang.org/")
	responseSize("https://golang.org/doc")
	fmt.Println(time.Since(start).Seconds(), "seconds")
}
