package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"time"
)

type Page struct {
	URL  string
	Size int
}

func responseSize(url string, channel chan Page) {
	fmt.Println("Getting", url)
	// Note: errors ignored with _!
	response, _ := http.Get(url)
	defer response.Body.Close()
	body, _ := ioutil.ReadAll(response.Body)
	channel <- Page{URL: url, Size: len(body)}
}

func main() {
	start := time.Now()
	pages := make(chan Page)
	urls := []string{"https://example.com/",
		"https://golang.org/", "https://golang.org/doc"}
	for _, url := range urls {
		go responseSize(url, pages)
	}
	for i := 0; i < len(urls); i++ {
		page := <-pages
		fmt.Printf("%s: %d\n", page.URL, page.Size)
	}
	fmt.Println(time.Since(start).Seconds())
}
