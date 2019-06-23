# Go Beginners Training - Gophercon 2019 - Jay McGavren

* Go syntax
    * Go file layout: package, imports, code
    * Running code
        * `go fmt`
        * `go run`
        * `go build`
    * Functions
    * Packages
    * Variables
        * Types
        * Short declarations
        * Zero values
    * Naming conventions (same for functions, variables, types, everything)
        * Exporting
        * Avoid shadowing
    * Type conversions
    * Calling methods
    * "if"
        * Initialization statement
    * "for"
        * Initialization statement
* Declaring Functions
    * Variable scope
    * `Printf`
        * Common verbs
        * `"%#v"`
        * `"%#T"`
    * Multiple return values
        * `error` type
* Declaring Packages
    * The Go workspace
        * `bin`
        * `pkg`
        * `src`
    * Environment variables
        * `GOPATH`
        * `PATH` (and `$GOPATH/bin/`)
    * Package directories
    * Naming conventions
    * Import paths
    * `go get`
    * `go doc`
        * Doc comments
    * `godoc`
* Arrays
    * Fixed size
    * Not often used; we just need to cover them to explain slices
    * Zero values
    * Array literals
    * `for ... range`
* Slices
    * Versus arrays
    * Underlying arrays
    * `make`
    * Slice literals
    * Slice operator
    * `append`
    * Slices and zero values
        * `nil` slices
        * Zero values in slice
    * `os.Args`
* Maps
    * `make`
    * Map literals
    * Zero values
        * `nil` maps
        * "Comma ok" pattern
    * `delete`
    * `for ... range`
        * Randomized order
* Structs
    * As underlying type for defined types
    * Pointers
        * Required in order to modify from function
        * Access fields with implicit dereference
    * Exporting fields
    * Struct literals
    * Embedding structs
* Defined types
    * With underlying basic types
    * Defining methods
        * Receiver parameter
        * Pointer receiver parameters
    * Getter and setter methods
    * Promotion of embedded types' methods
* Interfaces
    * Concrete types vs. interface types
    * Assignability
    * Type assertions
    * `error` interface
    * `Stringer` interface
    * Empty interface
* Handling errors
    * `defer`
    * `panic`
    * `recover`
        * Getting panic value
        * `panic` should not be used like an exception
* Concurrency
    * Goroutines
    * Channels
        * Synchronization
        * Data sharing
* Where to Go Next
    * `"testing"` package
    * Web development
        * `"net/http"` package
        * Gorilla
        * Buffalo
    * Buffered channels
    * Resources
        * Go Tour
        * Effective Go
        * `https://blog.golang.org`
        * `https://golang.org/pkg`
        * Books
            * _Head First Go_
            * _The Go Programming Language_

