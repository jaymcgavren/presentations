# The Go Language: What Makes it Different?

# Introduction

## About me

* Author, _Head First Go_
* Treehouse software development instructor

## Where to Learn Go

`https://tour.golang.org`

![](images/go_tour.png)

(We'll repeat that link at the end.)

## Another humble recommendation

![](images/head_first_go_cover.png)





# Why Go?

## Go at a glance

* C-like syntax
* Compiles to native code
* Type-safe
* Garbage collected
* Concurrency built into language

## OK, but what can you do with Go?

## Docker

![](images/docker.png)

## Docker

* "'go build' will embed everything you need. (No more 'install this in order to run my stuff'.)"
* "Extensive standard library and data types."
* "Strong duck typing."

—Jérôme Petazzoni, "Docker and Go: why did we decide to write Docker in Go?"

::: notes

https://www.slideshare.net/jpetazzo/docker-and-go-why-did-we-decide-to-write-docker-in-go

:::

## Kubernetes

![](images/kubernetes.png)

## Kubernetes

* "Code in Go isn't overly complex. People don't create FactoryFactory objects."
* "Something with the feel of C with more advanced features like anonymous functions is a great combo."
* "Garbage Collection: We all know how to clean up after our selves but it is so nice to not have to worry about it."

—Joe Beda, "Kubernetes + Go = Crazy Delicious"

## Poll: What do you want to make with Go?

1. A system utility
1. A web app or service
1. Something else entirely
1. I don't know yet

## Playground

* You don't even have to install Go to try it!
* Edit and run Go code in your browser

![](images/playground.png)

## Exercises for this training

* The Go Playground lets you save your code and share it at a URL
* Others can edit that code
* We'll use that ability for most of our exercises
* We'll post a link
* You visit it and follow the instructions there (add code, fill in blanks, etc.)





# Syntax

## Go file layout

* Package clause
* Imports
* Code

``` go
package main

import "fmt"

func main() {
	fmt.Println("Hello, Go!")
}
```

## "go fmt"

* Automatically fixes code style
* Acts as community's style guide
* No more arguing tabs vs. spaces!

## "go fmt"

Before

``` go
package main

import "fmt"

func main() {
repeatLine("hello", 3     )
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

## "go run"

* Compiles a Go source file and runs it
* No executable is saved

``` go
$ go run repeat.go
hello
hello
hello
```

## "go build"

* Compiles Go source file(s) into an executable

``` go
$ go build repeat.go
$ ls -l
total 2064
-rwxr-xr-x 1 jay staff 2106512 May  1 21:13 repeat
-rw-r--r-- 1 jay staff     166 May  1 21:13 repeat.go
$ ./repeat
hello
hello
hello
```

## Calling Functions

``` go
package main

import "fmt"

func main() {
	fmt.Println() // No arguments
	fmt.Println("argument 1")
	fmt.Println("argument 1", "argument 2")	
}
```

## Calling Functions

* `fmt.Println` can take any number and type of arguments.
* Most functions require a _specific_ number and type of arguments.

``` go
package main

import "math"

func main() {
	math.Floor(3.1415)        // valid...
	math.Floor()              // not enough arguments
	math.Floor(3.1415, 12.34) // too many arguments
	math.Floor("a string")    // wrong type
}
```

## Imports

``` go
package main

func main() {
	fmt.Println(math.Floor(2.75))
	fmt.Println(strings.Title("head first go"))
}
```

Compile errors:

```
prog.go:4:2: undefined: fmt
prog.go:4:14: undefined: math
prog.go:5:2: undefined: fmt
prog.go:5:14: undefined: strings
```

## Imports

Need to add `import` statement:

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

Output:

```
2
Head First Go
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

```
temp.go:5:5: imported and not used: "os"
```

## "goimports"

* Wrapper for `go fmt`
* Automatically adds/removes imports

Install:

``` go
$ go get golang.org/x/tools/cmd/goimports
```

Do a web search for "goimports" for directions on integrating with your editor.

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

## Must use every variable you declare

``` go
subtotal := 24.70
tax := 1.89
fmt.Println(subtotal)
```

Compile error:

```
prog.go:9:2: tax declared and not used
```

## "if"

``` go
if 1 < 2 {
	fmt.Println("It's true!")
}
```

Output:

```
It's true!
```

## "if"

Parentheses discouraged. `go fmt` will remove these:

``` go
if (1 < 2) {
	fmt.Println("It's true!")
}
```

Opening curly brace _must_ be on same line as `if`. This is a syntax error:

``` go
if (1 < 2)
{
	fmt.Println("It's true!")
}
```

## "for"

``` go
for x := 4; x <= 6; x++ {
	fmt.Println("x is now", x)
}
```

Output:

```
x is now 4
x is now 5
x is now 6
```

## Exercise: Go syntax





# Declaring Functions

## Declaring Functions

``` go
func sayHi() {
	fmt.Println("Hi!")
}

func main() {
	sayHi()
}
```

## Variable Scope

Variable scope limited to function where it's declared.

``` go
func myFunction() {
	myVariable := 10
}

func main() {
	myFunction()
	fmt.Println(myVariable) // out of scope!
}
```

Compile error:

```
prog.go:11:14: undefined: myVariable
```

## Variable Scope

By the way, variable scope also limited by "if" blocks:

``` go
if grade >= 60 {
	status := "passing"
} else {
	status := "failing"
}
fmt.Println(status) // out of scope!
```

## Variable Scope

And by "for" blocks:

``` go
	for x := 1; x <= 3; x++ {
		y := x + 1
		fmt.Println(y)
	}
	fmt.Println(y) // out of scope!
```

## Variable Scope

Solution is to declare variable _before_ block:

``` go
var status string // declare up here
if grade >= 60 {
	status = "passing" // still in scope
} else {
	status = "failing" // still in scope
}
fmt.Println(status) // still in scope
```

## Variable Scope

Same for loops:

``` go
var y int // declare up here
for x := 1; x <= 3; x++ {
	y = x + 1 // still in scope
	fmt.Println(y)
}
fmt.Println(y) // still in scope
```

## Function return values

So how do we get a value from a function to its caller?

``` go
func myFunction() {
	myVariable := 10
}

func main() {
	myFunction()
	fmt.Println(myVariable) // out of scope!
}
```

## Function return values

Add a return value!

``` go
// Add return value type after parentheses
func myFunction() int {
	// Use "return" keyword
	return 10
}

func main() {
	// Assign returned value to variable
	myVariable := myFunction()
	fmt.Println(myVariable)
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

```
prog.go:9:7: assignment mismatch: 1 variable but strconv.ParseBool returns 2 values
prog.go:10:7: assignment mismatch: 1 variable but strconv.ParseBool returns 2 values
```

## Multiple return values

``` go
func main() {
	flag, err := strconv.ParseBool("true")
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(flag)
	flag, err = strconv.ParseBool("foobar")
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(flag)
}
```

Output:

```
true
2009/11/10 23:00:00 strconv.ParseBool: parsing "foobar": invalid syntax
```

## Error handling

"In Go, error handling is important. The language's design and conventions encourage you to explicitly check for errors where they occur (as distinct from the convention in other languages of throwing exceptions and **sometimes** catching them)." (Emphasis mine)

-Andrew Gerrand, https://blog.golang.org/error-handling-and-go

## Writing functions with multiple return values

``` go
func parseBools(values []string) ([]bool, error) {
	var bools []bool
	for i, value := range values {
		parsed, err := strconv.ParseBool(value)
		if err != nil {
			return nil, fmt.Errorf(
                "invalid value %s at index %d", value, i)
		}
		bools = append(bools, parsed)
	}
	return bools, nil
}
```

## Writing functions with multiple return values

``` go
func main() {
	bools, err := parseBools(
        []string{"true", "false", "foobar"})
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(bools)
}
```

Output:

```
2009/11/10 23:00:00 invalid value foobar at index 2
```

## Exercise: Declaring Functions

## Pass-by-value

TODO

## Pointers

TODO

## Exercise: Passing pointers




# Declaring Packages

## The "main" package

* Code intended for direct execution goes in the `main` package.
* Go looks for a `main` function and calls that first.

``` go
package main

import "fmt"

func Hello() {
        fmt.Println("Hello!")
}
func Hi() {
        fmt.Println("Hi!")
}
func main() {
    Hello()
}
```

## The "main" package

But sticking everything in one package will only get you so far...

## The Go workspace

* A directory to hold package code.
* `~/go` by default.
* Or set `$GOPATH` environment variable to a different directory.

## Workspace subdirectories

* `bin`: holds binary executables.
    * Add it to your `$PATH` and you can run them from anywhere.
* `pkg`: holds compiled package files.
    * You generally don't need to touch this.
* `src`: holds source code.
    * Including your code!

## Setting up a package

Let's move our functions to another package.

`~/go/src/greeting/greeting.go`

``` go
package greeting

import "fmt"

func Hello() {
        fmt.Println("Hello!")
}

func Hi() {
        fmt.Println("Hi!")
}
```

## Importing our package

`random_directory/hi.go`

``` go
package main

import "greeting"

func main() {
        greeting.Hello()
        greeting.Hi()
}
```

## "go run"

```
$ go run hi.go
Hello!
Hi!
```

## Moving "main" to the workspace

`~/go/src/hi/main.go`

``` go
package main

import "greeting"

func main() {
        greeting.Hello()
        greeting.Hi()
}
```

## "go install"

```
$ go install
$ tree ~/go
go
|-- bin
|   `-- hi
`-- src
    |-- greeting
    |   `-- greeting.go
    `-- hi
        `-- main.go
```

## "go install"

```
$ export PATH=$PATH:$HOME/go/bin
```

(Go installer does this for you.)

## "go install"

```
$ hi
Hello!
Hi!
```

## Exported

TODO

## Unexported

TODO

## Import paths

TODO

## "go get"

I set up a repo at `https://github.com/headfirstgo/greeting`, and pushed the package code there...

![](images/github.png)

## "go get"

Now anyone can retrieve the package with `go get github.com/headfirstgo/greeting`:

```
$ go get github.com/headfirstgo/greeting
$ tree ~/go
go
`-- src
    `-- github.com
        `-- headfirstgo
            `-- greeting
                |-- dansk
                |   `-- dansk.go
                |-- deutsch
                |   `-- deutsch.go
                `-- greeting.go
```

## "go get"

`~/go/src/hi/main.go`

``` go
package main

import (
        "github.com/headfirstgo/greeting"
        "github.com/headfirstgo/greeting/dansk"
        "github.com/headfirstgo/greeting/deutsch"
)

func main() {
        greeting.Hello()   // => Hello!
        dansk.Hej()        // => Hej!
        deutsch.GutenTag() // => Guten Tag!
}
```

## "go doc"

TODO Doc comments

## Web documentation

TODO

## Exercise: Using package documentation





# Structs

## Structs

Anonymous struct types...

``` go
var bucket struct {
	number float64
	word   string
	toggle bool
}
bucket.number = 3.14
bucket.word = "pie"
bucket.toggle = true
fmt.Println(bucket.number) // => 3.14
fmt.Println(bucket.word)   // => pie
fmt.Println(bucket.toggle) // => true
```

## Custom types

`type myType` followed by an underlying type declares a new type.

``` go
type myType struct {
	number float64
	word   string
	toggle bool
}
```

## Custom types

``` go
func main() {
	var bucket myType
	bucket.number = 3.14
	bucket.word = "pie"
	bucket.toggle = true
	fmt.Println(bucket.number) // => 3.14
	fmt.Println(bucket.word)   // => pie
	fmt.Println(bucket.toggle) // => true
}
```

## Embedding structs is like inheriting fields

``` go
type Coordinates struct {
	Latitude  float64
	Longitude float64
}

type Landmark struct {
	Name string
	// An "anonymous field"
	// Has no name of its own, just a type
	Coordinates
}
```

``` go
func main() {
	var l Landmark
	l.Name = "The Googleplex"
	// Fields for "embedded struct" are "promoted"
	l.Latitude = 37.42
	l.Longitude = -122.08
	fmt.Println(l.Name, l.Latitude, l.Longitude)
	// => The Googleplex 37.42 -122.08
}
```

## Exercise: Struct types



# Defined Types

## Underlying basic types

A custom type can have an underlying basic type

``` go
type Liters float64
type Gallons float64

func main() {
	var carFuel Gallons
	var busFuel Liters
	// Defining a type defines a conversion
	// from the underlying type to the new type
	carFuel = Gallons(10.0)
	busFuel = Liters(240.0)
	fmt.Println(carFuel) // => 10
	fmt.Println(busFuel) // => 240
}
```

## Methods

``` go
type MyType string

// Specify a "receiver parameter" within a function
// definition to make it a method. The receiver 
// parameter's type will be the type the method 
// gets defined on.
func (m MyType) sayHi() {
	fmt.Println("Hi")
}
```

## Methods

``` go
type MyType string

func (m MyType) sayHi() {
	fmt.Println("Hi")
}

func main() {
	value := MyType("a MyType value")
	value.sayHi() // => Hi
	anotherValue := MyType("another value")
	anotherValue.sayHi() // => Hi
}
```

## Receiver parameter acts like just another parameter

``` go
type MyType string

func (m MyType) sayHi() {
	fmt.Println("Hi from", m)
}

func main() {
	value := MyType("a MyType value")
	value.sayHi() // => Hi from a MyType value
	anotherValue := MyType("another value")
	anotherValue.sayHi() // => Hi from another value
}
```

## Underlying type is _not_ a superclass

The underlying type specifies how a type's data will be stored, so this is OK...

``` go
type MyType string

func (m MyType) sayHi() {
	fmt.Println("Hi from", m)
}

type MyType2 MyType

func main() {
	value2 := MyType2("a MyType2 value")
	fmt.Println(value2)
}
```

## Underlying type is _not_ a superclass

But a type does _not_ inherit methods from its underlying type.

``` go
type MyType string

func (m MyType) sayHi() {
	fmt.Println("Hi from", m)
}

type MyType2 MyType

func main() {
	value2 := MyType2("a MyType2 value")
	value2.sayHi()
}
```

Compile error:

``` go
prog.go:15:8: value2.sayHi undefined (type MyType2 has no field or method sayHi)
```

## Underlying type is _not_ a superclass

"Although Go has types and methods and allows an object-oriented style of programming, there is no type hierarchy."

—https://golang.org/doc/faq

* There is no method inheritance!
* But there's another way to get the same benefits...

## Embedding structs is like inheriting fields

Remember how fields for an embedded struct get promoted to the outer struct?

``` go
type Coordinates struct {
	Latitude  float64
	Longitude float64
}

type Landmark struct {
	Name string
	// An "anonymous field"
	// Has no name of its own, just a type
	Coordinates
}
```

``` go
func main() {
	var l Landmark
	l.Name = "The Googleplex"
	// Fields for "embedded struct" are "promoted"
	l.Latitude = 37.42
	l.Longitude = -122.08
	fmt.Println(l.Name, l.Latitude, l.Longitude)
	// => The Googleplex 37.42 -122.08
}
```


## Promotion of embedded types' methods

Methods for an embedded type get promoted too!

``` go
func (c Coordinates) Location() string {
	return fmt.Sprintf("(%0.2f, %0.2f)",
		c.Latitude, c.Longitude)
}

func main() {
	var l Landmark
	l.Name = "The Googleplex"
	l.Latitude = 37.42
	l.Longitude = -122.08
	// Methods from embedded type are
	// promoted to outer type
	fmt.Println(l.Location())
	// => (37.42, -122.08)
}
```

## Promotion of embedded types' methods

* Embed additional types to gain additional methods.
* You've heard "favor composition over inheritance"...
* Go implements that principle at the language level.

``` go
type Coordinates struct {
	Latitude  float64
	Longitude float64
}
func (c Coordinates) Location() string {
	return fmt.Sprintf("(%0.2f, %0.2f)",
		c.Latitude, c.Longitude)
}
type Landmark struct {
	Name string
	Coordinates
}
```

## Exercise: Defined types






# Interfaces

## Interfaces

A type with `Play` and `Stop` methods...

``` go
type TapePlayer struct {
	Batteries string
}
func (t TapePlayer) Play(song string) {
	fmt.Println("Playing", song)
}
func (t TapePlayer) Stop() {
	fmt.Println("Stopped!")
}
```

## Interfaces

_Another_ type with `Play` and `Stop` methods...

``` go
type TapeRecorder struct {
	Microphones int
}
func (t TapeRecorder) Play(song string) {
	fmt.Println("Playing", song)
}
func (t TapeRecorder) Record() {
	fmt.Println("Recording")
}
func (t TapeRecorder) Stop() {
	fmt.Println("Stopped!")
}
```

## Interfaces

A function that accepts a `TapePlayer`...

``` go
func playList(device TapePlayer, songs []string) {
	for _, song := range songs {
		device.Play(song)
	}
	device.Stop()
}
```

## Interfaces

``` go
func main() {
	mixtape := []string{"Jessie's Girl", "Whip It", "9 to 5"}
	var player TapePlayer
	playList(player, mixtape)
}
```

Output:

```
Playing Jessie's Girl
Playing Whip It
Playing 9 to 5
Stopped!
```

## Interfaces

But don't try to pass a `TapeRecorder` to `playList`!

``` go
func main() {
	mixtape := []string{"Jessie's Girl", "Whip It", "9 to 5"}
	var recorder TapeRecorder
	playList(recorder, mixtape)
}
```

Compile error:

```
prog.go:40:10: cannot use recorder (type TapeRecorder) as type TapePlayer in argument to playList
```

## Interfaces

Define a `Player` interface with the methods you want:

``` go
type Player interface {
    // Must have a Play method with
    // a single string parameter
	Play(string)
    // Must have a Stop method with
    // no parameters
	Stop()
}
```

* Notice we don't have to modify the `TapePlayer` or `TapeRecorder` type definitions!
* Any type with `Play(string)` and `Stop()` methods automatically _satisfies_ this interface.

## Interfaces

Modify the `playList` function to accept a value of the `Player` (interface) type:

``` go
func playList(device Player, songs []string) {
	for _, song := range songs {
		device.Play(song)
	}
	device.Stop()
}
```

## Interface

Now, you can pass in a `TapePlayer` _or_ a `TapeRecorder` (or any other type with `Play` and `Stop` methods)!

``` go
func main() {
	mixtape := []string{"Jessie's Girl", "Whip It", "9 to 5"}
	var player TapePlayer
	playList(player, mixtape)
	var recorder TapeRecorder
	playList(recorder, mixtape)
}
```

## Interfaces

Output:

```
Playing Jessie's Girl
Playing Whip It
Playing 9 to 5
Stopped!
Playing Jessie's Girl
Playing Whip It
Playing 9 to 5
Stopped!
```

## Type assertions

TODO

## Exercise: Interfaces



# Handling Errors

## "defer"

It's usually polite to end conversations with "goodbye":

``` go
func Socialize() {
	fmt.Println("Hello!")
	fmt.Println("Nice weather, eh?")
	fmt.Println("Goodbye!")
}

func main() {
	Socialize()
}
```

Output:

```
Goodbye!
Hello!
Nice weather, eh?
```

## "defer"

Write `defer` before a function call, and it will be "deferred" until enclosing function ends.

``` go
func Socialize() {
	// This call will be made when Socialize ends.
	defer fmt.Println("Goodbye!")
	fmt.Println("Hello!")
	fmt.Println("Nice weather, eh?")
}
```

Output:

```
Hello!
Nice weather, eh?
Goodbye!
```

## "defer" calls made no matter what

``` go
func Socialize() error {
	// Deferred call is made even if Socialize
	// exits early (say, due to an error).
	defer fmt.Println("Goodbye!")
	fmt.Println("Hello!")
	return fmt.Errorf("I don't want to talk.")
	// The below code won't be run!
	fmt.Println("Nice weather, eh?")
	return nil
}

func main() {
	err := Socialize()
	if err != nil {
		log.Fatal(err)
	}
}
```

## "defer" calls made no matter what

Output:

```
Hello!
Goodbye!
2019/04/22 11:22:29 I don't want to talk.
exit status 1
```

## A (somewhat) more realistic example

``` go
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
```

## A (somewhat) more realistic example

``` go
func main() {
	err := PrintLines("lorem_ipsum.txt")
	if err != nil {
		log.Fatal(err)
	}
}
```

## "panic"

* `panic` usually signals an _unanticipated_ error.
* This example is just to show its mechanics.

``` go
func Socialize() {
	fmt.Println("Hello!")
	panic("I need to get out of here!")
	// The below code won't be run!
	fmt.Println("Nice weather, eh?")
	fmt.Println("Goodbye!")
}
```

## "panic"

Output:

``` go
Hello!
panic: I need to get out of here.

goroutine 1 [running]:
main.Socialize()
        /Users/jay/socialize4_panic.go:9 +0x79
main.main()
        /Users/jay/socialize4_panic.go:16 +0x20
exit status 2
```

## "panic" and "defer"

``` go
func Socialize() {
	defer fmt.Println("Goodbye!")
	fmt.Println("Hello!")
	panic("I need to get out of here!")
	// The below code won't be run!
	fmt.Println("Nice weather, eh?")
}
```

## "panic" and "defer"

Output:

```
Hello!
Goodbye!
panic: I need to get out of here!

goroutine 1 [running]:
main.Socialize()
        /Users/jay/socialize5_panic_defer.go:10 +0xd5
main.main()
        /Users/jay/socialize5_panic_defer.go:16 +0x20
exit status 2
```

## "recover"

``` go
func CalmDown() {
	// Halt the panic.
	panicValue := recover()
	// Print value passed to panic().
	fmt.Println(panicValue)
}

func Socialize() {
	defer fmt.Println("Goodbye!")
	defer CalmDown()
	fmt.Println("Hello!")
	panic("I need to get out of here!")
	// The below code won't be run!
	fmt.Println("Nice weather, eh?")
}
```

## "recover"

Output:

```
Hello!
I need to get out of here!
Goodbye!
```

* Deferred `CalmDown` prints the `panic` value.
* Deferred `Println` prints "Goodbye!".

## "panic" should not be used like an exception

I know of one place in the standard library that `panic` is used in normal program flow: in a recursive parsing function that panics to unwind the call stack after a parsing error. (The function then recovers and handles the error normally.)

## "panic" should not be used like an exception

Generally, `panic` should be used only to indicate "impossible" situations:

``` go
func awardPrize() {
	doorNumber := rand.Intn(3) + 1
	if doorNumber == 1 {
		fmt.Println("You win a cruise!")
	} else if doorNumber == 2 {
		fmt.Println("You win a car!")
	} else if doorNumber == 3 {
		fmt.Println("You win a goat!")
	} else {
        // This should never happen.
		panic("invalid door number")
	}
}
```

## "panic" should not be used like an exception

* If you know an error could happen, use normal control flow statements to handle it.
* Google "golang errors are values" (which should take you to `https://blog.golang.org/errors-are-values`) for some tips on making error handling more pleasant.

## Exercise: Handling errors




# Concurrency

## A non-concurrent program

``` go
// responseSize retrieves "url" and prints
// the response length in bytes.
func responseSize(url string) {
	fmt.Println("Getting", url)
	// Note: errors ignored with _!
	response, _ := http.Get(url)
	defer response.Body.Close()
	body, _ := ioutil.ReadAll(response.Body)
	fmt.Println(len(body))
}
```

## A non-concurrent program

``` go
func main() {
    // Note the time we started.
	start := time.Now()
	responseSize("https://example.com/")
	responseSize("https://golang.org/")
	responseSize("https://golang.org/doc")
    // Print how long everything took.
	fmt.Println(time.Since(start).Seconds(), "seconds")
}
```

## A non-concurrent program

Output:

```
Getting https://example.com/
1270
Getting https://golang.org/
8158
Getting https://golang.org/doc
12558
1.5341211000000001 seconds
```

If only we could make additional calls to `responseSize` while we were waiting for HTTP responses...

## Goroutines

* `responseSize` function unchanged.
* Just add `go` keyword before each call to it.

``` go
func main() {
	start := time.Now()
	go responseSize("https://example.com/")
	go responseSize("https://golang.org/")
	go responseSize("https://golang.org/doc")
	fmt.Println(time.Since(start).Seconds())
}
```

## Goroutines

Output:

``` go
3.1e-06
```

* Run time so brief the duration is printed in scientific notation.
* None of the `responseSize` goroutines get to even request their URL.
* Problem is, `main` goroutine exits, ending the program, without waiting for `responseSize` goroutines.

## Channels

* Modify `responseSize` to accept a "channel" as a parameter.

``` go
// A channel type is written as "chan" followed by data type.
func responseSize(url string, channel chan int) {
	fmt.Println("Getting", url)              // Unchanged
	response, _ := http.Get(url)             // Unchanged
	defer response.Body.Close()              // Unchanged
	body, _ := ioutil.ReadAll(response.Body) // Unchanged
    // Send body length value via channel.
	channel <- len(body)
}
```

## Channels

``` go
func main() {
	start := time.Now() // Unchanged
    // Make a channel to carry ints.
	sizes := make(chan int)
    // Pass channel to each call to responseSize.
	go responseSize("https://example.com/", sizes)
	go responseSize("https://golang.org/", sizes)
	go responseSize("https://golang.org/doc", sizes)
    // Read and print values from channel.
	fmt.Println(<-sizes)
	fmt.Println(<-sizes)
	fmt.Println(<-sizes)
	fmt.Println(time.Since(start).Seconds()) // Unchanged
}
```

## Channels

```
Getting https://golang.org/doc
Getting https://golang.org/
Getting https://example.com/
1270
8158
12558
0.695384291
```

* Finishes in half the time of the original! (YMMV.)
* The channel accomplishes two things:
    * Channel reads cause `main` goroutine to block until `responseSize` goroutines send, so they have time to finish before program ends.
    * The channel transmits data from the `responseSize` goroutines back to the `main` goroutine.

## Exercise: Goroutines and channels

https://is.gd/goex_goroutines

<!-- https://play.golang.org/p/mtfvNLts6Vm -->

<!-- solutions/goroutines.go -->









# Where to Go Next

## Arrays

TODO eliminate zero values

``` go
var primes [3]int
primes[0] = 2
primes[1] = 3
fmt.Println(primes[0]) // => 2
fmt.Println(primes[1]) // => 3
fmt.Println(primes)    // => [2 3 0]
// primes[2] is at zero value
```

* Can't grow when needed
* To me, they're just a foundation for slices

## Slices

TODO eliminate zero values

``` go
var primes []int        // Zero value is nil
primes = make([]int, 3) // Create a slice
primes[0] = 2
primes[1] = 3
fmt.Println(primes[0])  // => 2
fmt.Println(primes[1])  // => 3
fmt.Println(primes)     // => [2 3 0]
```

## Slices and "append"

``` go
var primes []int
primes = append(primes, 2)
primes = append(primes, 3)
fmt.Println(primes[0]) // => 2
fmt.Println(primes[1]) // => 3
fmt.Println(primes)    // => [2 3]
primes = append(primes, 5)
fmt.Println(primes)    // => [2 3 5]
```

## Maps

``` go
func main() {
        ranks := make(map[string]int)
        ranks["gold"] = 1
        ranks["silver"] = 2
        ranks["bronze"] = 3
        fmt.Println(ranks["bronze"]) // => 3
        fmt.Println(ranks["gold"])   // => 1
}
```

## "testing" package

TODO

## Web development

TODO

## Buffered channels

TODO

## Go Gopher

By Renee French, used under a CC-Attribution-3.0 license.

![](images/gopher_color.png)

## Other resources

* Go Tour: `https://tour.golang.org`
* Go Playground: `https://play.golang.org`
* Head First Go: `https://headfirstgo.com`
