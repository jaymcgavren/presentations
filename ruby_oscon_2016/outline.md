# Ruby is an interpreted language

Show diagrams from Head First Ruby.

Show video of altering a controller on a running Rails server.

## Running a .rb file

```ruby
puts "Hello, world!"
```

## Piping in code

## -e arguments

## irb

### 'exit' to quit

# Math operations and comparisons

```ruby
1 + 2
5.4 - 2.2
3 * 4
7 / 3.5
5 % 3
```

```ruby
4 < 6
4 > 6
2 + 2 == 5
```

# Strings

```ruby
'Hello, world!'
"2 plus 4 is: #{2 + 4}"
```

# Variables

```ruby
small = 8
medium = 12
small + medium
```

```ruby
pie = "Lemon"
pie = 3.14
```

# Everything is an object

```ruby
"Hello".upcase
"Hello".reverse
42.even?
42.odd?
-35.abs
```

# if/else

```ruby
number = 1
while number <= 20
  if number % 3 == 0 && number % 5 == 0
    puts "FizzBuzz"
  elsif number % 3 == 0
    puts "Fizz"
  elsif number % 5 == 0
    puts "Buzz"
  else
    puts number
  end
  number += 1
end
```

```ruby
number = 1
while number <= 20
  puts "Fizz" if number % 3 == 0
  puts "Buzz" if number % 5 == 0
  puts number if number % 3 != 0 && number % 5 != 0
  number += 1
end
```

# Methods

```ruby
def fizz_buzz(number)
  if number % 3 == 0 && number % 5 == 0
    puts "FizzBuzz"
  elsif number % 3 == 0
    puts "Fizz"
  elsif number % 5 == 0
    puts "Buzz"
  else
    puts number
  end
end

number = 1
while number <= 20
  fizz_buzz(number)
  number += 1
end
```

Leave the parenthesis off when calling a method, if you want.

```ruby
def fizz_buzz(number)
  if number % 3 == 0 && number % 5 == 0
    puts "FizzBuzz"
  elsif number % 3 == 0
    puts "Fizz"
  elsif number % 5 == 0
    puts "Buzz"
  else
    puts number
  end
end

number = 1
while number <= 20
  fizz_buzz number
  number += 1
end
```

Let's move the loop to a method, as well.

```ruby
def fizz_buzz(number)
  if number % 3 == 0 && number % 5 == 0
    puts "FizzBuzz"
  elsif number % 3 == 0
    puts "Fizz"
  elsif number % 5 == 0
    puts "Buzz"
  else
    puts number
  end
end

def iterate(first, last, increment)
  number = first
  while number <= last
    fizz_buzz(number)
    number += increment
  end
end

iterate(1, 10, 2)
```

Set default arguments.

```ruby
def fizz_buzz(number)
  if number % 3 == 0 && number % 5 == 0
    puts "FizzBuzz"
  elsif number % 3 == 0
    puts "Fizz"
  elsif number % 5 == 0
    puts "Buzz"
  else
    puts number
  end
end

def iterate(first = 1, last = 20, increment = 1)
  number = first
  while number <= last
    fizz_buzz(number)
    number += increment
  end
end

iterate(1, 5)
puts "-" * 20
iterate
```
