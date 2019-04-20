TODO add "you are here" slides before each major section that list sections

# Introduction

## About Me

* Author, _Head First Go_
* Treehouse instructor

## Talk Overview

TODO major sections
TODO questions
TODO Goals: not here to learn the language, just to get a taste. I'll be moving fast.
TODO slides are posted

# A Sneak Peek

## Hello, world

``` go
package main

import "fmt"

func main() {
	fmt.Println("Hello, Philadelphia!")
}
```

TODO packages
TODO goroutines, channels
TODO "net/http"

# Why Go?

## Go at a glance

* C-like syntax
* Compiles to native code
* Type-safe
* Garbage collected
* Concurrency built into language

## Languages in order of creation

| Year | Language |
| ---- | -------- |
| 1972 | C |
| 1983 | C++ |
| 1991 | Python |
| 1995 | Java |
| 1995 | JavaScript |
| 1995 | PHP |
| 1995 | Ruby |
| 2000 | C# |
| 2009 | **Go** |
| 2011 | Kotlin |
| 2014 | Swift |

https://en.wikipedia.org/wiki/Timeline_of_programming_languages

## Languages in (subjective) order of execution speed

https://benchmarksgame-team.pages.debian.net/benchmarksgame/performance/mandelbrot.html

| Run Time | Language |
| -------- | -------- |
| 1.5s | C++ |
| 1.65s | C |
| 2.2s | Rust |
| 3.22 | Swift |
| 5.5s | **Go** |
| 5.5s | C# (.NET Core) |
| 6.84s | Java |
| 18.13s | JavaScript (Node.js) |
| 118.28s | PHP |
| 265.56s | Python 3 |
| >420s | Ruby |

## Languages in (subjective) order of execution speed

https://benchmarksgame-team.pages.debian.net/benchmarksgame/performance/binarytrees.html

| Run Time | Language |
| -------- | -------- |
| 3.1s | Rust |
| 3.48s | C |
| 3.77s | C++ |
| 5.05s | Swift |
| 7.85s | C# (.NET Core) |
| 8.32s | Java |
| 26.94s | **Go** |
| 45.89s | JavaScript (Node.js) |
| 58.93s | PHP |
| 64.07s | Ruby |
| 81.74s | Python 3 |

## Languages in (subjective) order of deployment ease

1. Native binary: C++, C, **Go**, Rust
1. Standalone *or* framework/VM dependent: C#, Kotlin
1. VM-dependent: JavaScript, Java
1. Interpreter-dependent: Python, PHP, Ruby

## Languages in order of popularity

1. JavaScript (67.8%)
1. Python (41.7%)
1. Java (41.1%)
1. C# (31.0%)
1. PHP (26.4%)
1. C++ (23.5%)
1. C (20.6%)
1. Ruby (8.4%)
1. **Go** (8.2%)
1. Swift (6.6%)
1. Kotlin (6.4%)
1. Rust (3.2%)

Stack Overflow 2019 Developer Survey - percentage of developers saying they use a language

::: notes
Markup, shell, and database query languages omitted
:::

## Rationale

"we had become frustrated by the undue complexity required to use the languages we worked with to develop server software"

"multi[-core] processors were becoming universal but most languages offered little help to program them efficiently and safely"

"to make resource management tractable in a large concurrent program, garbage collection... was required"

—https://golang.org/doc/faq

## Some overgeneralizations

* Go always favors simplicity.
    * If a feature complicates code, or slows down compilation or execution, it's left out.
* Go values conceptual consistency.
    * Blocks work the same at all levels (func/for/if)
    * Same naming rules for everything (variables/functions/types)

## Left out (on purpose)

* Constructors
* Method overloading
* Class inheritance (mostly)
* Exceptions

## NO EXCEPTIONS?!

"We believe that coupling exceptions to a control structure, as in the try-catch-finally idiom, results in convoluted code. It also tends to encourage programmers to label too many ordinary errors, such as failing to open a file, as exceptional."

"For plain error handling, Go's multi-value returns make it easy to report an error without overloading the return value."

—https://golang.org/doc/faq

## Why Goroutines?

"multiplex independently executing functions—coroutines—onto a set of threads"

"The result, which we call goroutines, can be very cheap"

"It is practical to create hundreds of thousands of goroutines in the same address space"

—https://golang.org/doc/faq

## Go and object-oriented programming

"Although Go has types and methods and allows an object-oriented style of programming, there is no type hierarchy."

"There are... ways to embed types in other types to provide something analogous—but not identical—to subclassing."

"methods in Go are more general than in C++ or Java: they can be defined for any sort of data, even built-in types"

—https://golang.org/doc/faq

## Neat stuff

* First-class functions
* Built-in UTF8 support
* Interfaces fully decoupled from types
* `go get` package manager standard
* `go format` command formats code for you
* Unit testing in standard library



# Go Fundamentals

## Go file layout

* `package`
* `import`
* Code

## Go file layout

``` go
package main 

import "fmt" 

func main() {
	fmt.Println("Hello, Go!")
}
```

## Go file layout

``` go
package main

import (
	"fmt"
	"math"
	"strings"
)

func main() {
	fmt.Println(math.Floor(2.75))
	fmt.Println(strings.Title("head first go"))
}
```

## Go file layout

``` go
package keyboard

import (
	"bufio"
	"os"
	"strconv"
	"strings"
)

func GetFloat() (float64, error) {
	// GetFloat code here...
}
```

## Unused imports not allowed

``` go
package main 

import (
	"fmt"
    "os"
)

func main() {
	fmt.Println("Hello, Go!")
}
```

Compile error:

``` go
temp.go:5:5: imported and not used: "os"
```

## "go fmt"

Before

``` go
package main

import "fmt"

func main() {
	    repeatLine("hello", 3)
}

func repeatLine( line string ,times  int) {
	for i := 0; i < times; i++ {
fmt.Println(line)
	}
}
```

## "go fmt"

``` go
$ go fmt repeat.go
```

## "go fmt"

After

``` go
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
```

## "goimports"

* Automatically adds/removes imports
* Wrapper for `go fmt`

Install:

``` go
$ go get golang.org/x/tools/cmd/goimports
```

See directions at https://godoc.org/golang.org/x/tools/cmd/goimports for integrating with your editor.

## "goimports"

Before saving

``` go
package main

func main() {
	fmt.Println(math.Floor(2.75))
	fmt.Println(strings.Title("head first go"))
}
```

## "goimports"

After saving

``` go
package main

import (
        "fmt"
        "math"
        "strings"
)

func main() {
        fmt.Println(math.Floor(2.75))
        fmt.Println(strings.Title("head first go"))
}
```

## Variables

``` go
var myInteger int
myInteger = 1
var myFloat float64
myFloat = 3.1415
fmt.Println(myInteger)                 // => 1
fmt.Println(myFloat)                   // => 3.1415
fmt.Println(reflect.TypeOf(myInteger)) // => int
fmt.Println(reflect.TypeOf(myFloat))   // => float64
```

## Short Variable Declarations

``` go
myInteger := 1
myFloat := 3.1415
fmt.Println(myInteger)                 // => 1
fmt.Println(myFloat)                   // => 3.1415
fmt.Println(reflect.TypeOf(myInteger)) // => int
fmt.Println(reflect.TypeOf(myFloat))   // => float64
```

## Type Safety

``` go
myInteger := 1
myFloat := 3.1415
myInteger = "3"
```

Compile error: 

``` go
prog.go:6:14: cannot use "3" (type string) as type int in assignment
```

## Type Safety

``` go
myInteger := 1
myFloat := 3.1415
fmt.Println(myInteger + myFloat)
```

Compile error: 

``` go
prog.go:8:24: invalid operation: myInteger + myFloat (mismatched types int and float64)
```

## Casting

``` go
myInteger := 1
myFloat := 3.1415
fmt.Println(float64(myInteger) + myFloat)
// => 4.141500000000001
```

## Must use every variable you declare

``` go
subtotal := 24.70
tax := 1.89
fmt.Println(subtotal)
```

Compile error:

``` go
prog.go:9:2: tax declared and not used
```

## "if" is unsurprising

``` go
if 1 < 2 {
	fmt.Println("Universe is OK")
} else {
	fmt.Println("We have a problem")
}
```

## "for" is unsurprising

``` go
for i := 1; i <= 3; i++ {
	fmt.Println(i)
}
```

## "for" is unsurprising... mostly

``` go
mySlice := []string{"one", "two", "three"}
for i, value := range mySlice {
	fmt.Println(i, value)
}
```

Output:

``` go
0 one
1 two
2 three
```

## What if we skip using the index?

``` go
mySlice := []string{"one", "two", "three"}
for i, value := range mySlice {
	fmt.Println(value)
}
```

Compile error:

``` go
prog.go:9:6: i declared and not used
```

## Use the blank identifier to ignore values

(Provides clear visual indicator that a value's being ignored!)

``` go
mySlice := []string{"one", "two", "three"}
for _, value := range mySlice {
	fmt.Println(value)
}
```

Output:

``` go
one
two
three
```

## Functions

``` go
func quote(text string) {
	lines := strings.Split(text, "\n")
	for _, line := range lines {
		fmt.Println(">", line)
	}
}

func main() {
	originalMessage :=
`You still haven't finished your
PhillyETE slides?? ...Fine. Just
PLEASE have them ready Tuesday!`
	quote(originalMessage)
	fmt.Println("I will, I promise!")
}
```

## Return values

``` go
// Specify return value type after parameters
func quote(text string) []string {
	lines := strings.Split(text, "\n")
	var quoted []string
	for _, line := range lines {
		quoted = append(quoted, "> "+line)
	}
	return quoted
}
```

## Return values

``` go
func main() {
	originalMessage :=
`You still haven't finished your
PhillyETE slides?? ...Fine. Just
PLEASE have them ready Tuesday!`
	quoted := quote(originalMessage)
	for _, line := range quoted {
		fmt.Println(line)
	}
}
```

## Multiple return values

``` go
func main() {
	flag := strconv.ParseBool("true")
	flag = strconv.ParseBool("foobar")
	fmt.Println(flag)
}
```

Compile error:

``` go
prog.go:9:7: assignment mismatch: 1 variable but strconv.ParseBool returns 2 values
prog.go:10:7: assignment mismatch: 1 variable but strconv.ParseBool returns 2 values
```

## First-class functions


## Go is pass-by-value

``` go
func Increment(value int) {
	value += 1
}

func main() {
	value := 9
	Increment(value)
	fmt.Println(value) // => 9
}
```

## Pointers

``` go
// *mytype is a pointer type
func Increment(myPointer *int) {
	// Read "*myPointer" aloud as "value at myPointer"
	*myPointer += 1
}

func main() {
	value := 9
    // Read "&value" aloud as "address of value"
	Increment(&value)
	fmt.Println(value) // => 10
}
```

## Arrays

TODO Don't use; just a foundation for slices

## Slices

## Maps

TODO unsurprising

## Custom types

* Underlying basic types

## Structs



# Packages

## Exported

## Unexported

## `go build`

## `go install`

The Go workspace

* `bin`
* `pkg`
* `src`

Package directories

## Import paths

## `go get`

## `go doc`

* Doc comments

## Web documentation



# OOP-*like* Concepts

## Methods

* Receiver parameter
* Pointer receiver parameters?

## Embedding structs

## Promotion of embedded types' methods

## Interfaces

## `error` interface

## `stringer` interface

## Empty interface

## Type assertions


# `defer`, `panic`, and `recover`

## `defer`

## `panic`

## `recover`

## Getting panic value

## `panic` should not be used like an exception




# Concurrency

## Goroutines

## Channels

## Synchronization

"testing" package

Web development

"net/http" package

Gorilla

Buffalo

Buffered channels

Other resources
