# Setup

* Load new iTerm window with Screencast preset:
** 90 columns
** 35 rows
** Menlo 18pt font
* export PROMPT_COMMAND=''; export PS1="\[\033[1;34m\]\w\n$\[\033[0m\] "
* Set up 1024 x 768 browser window.

# Introduction

Summary: intro, core classes, standard library, gems

Today's session isn't a step-by-step guide, more of an overview to show you what's possible.

You don't have to code along today unless you want to. Video of the session will be posted in a few days; code along to that. (Or better yet, buy Head First Ruby and work through that!)

## What is Ruby?

I want to spend a few minutes going over what Ruby is and some of the basics, for those who are new to the language. If you're already a Ruby user, please bear with us. This won't take long.

Focused on developer happiness.

* Easy to learn and use
* Gives the programmer less stress (doesn't fight you!)

Screenshot from book of compilation vs. interpretation

## Ruby libraries

### Core classes

Automatically loaded every time you launch Ruby.

Array
BasicObject
Bignum
Binding
Class
Complex
Dir
Encoding
Enumerator
Exception
Fiber
Fixnum
Float
Hash
Integer
IO
MatchData
Method
Module
Mutex
NilClass
Numeric
Object
Proc
Random
Range
Rational
Regexp
String
Struct
Symbol
Thread
ThreadGroup
Time
TracePoint
TrueClass
UnboundMethod

Methods on Array class:

&
*
+
-
<<
<=>
==
[]
[]=
abbrev
any?
assoc
at
bsearch
clear
collect
collect!
combination
compact
compact!
concat
count
cycle
dclone
delete
delete_at
delete_if
drop
drop_while
each
each_index
empty?
eql?
fetch
fill
find_index
first
flatten
flatten!
frozen?
hash
include?
index
initialize_copy
insert
inspect
join
keep_if
last
length
map
map!
pack
permutation
pop
product
push
rassoc
reject
reject!
repeated_combination
repeated_permutation
replace
reverse
reverse!
reverse_each
rindex
rotate
rotate!
sample
select
select!
shelljoin
shift
shuffle
shuffle!
size
slice
slice!
sort
sort!
sort_by!
take
take_while
to_a
to_ary
to_h
to_s
transpose
uniq
uniq!
unshift
values_at
zip
[From Enumerable:]
all?
any?
chunk
collect
collect_concat
count
cycle
detect
drop
drop_while
each_cons
each_entry
each_slice
each_with_index
each_with_object
entries
find
find_all
find_index
first
flat_map
grep
group_by
include?
inject
lazy
map
max
max_by
member?
min
min_by
minmax
minmax_by
none?
one?
partition
reduce
reject
reverse_each
select
slice_after
slice_before
slice_when
sort
sort_by
take
take_while
to_a
to_h
to_set
zip


### Standard library

Included with Ruby, but you need to explicitly load them.

Examples:

* ERB
* JSON
* YAML

Abbrev
Base64
Benchmark
BigDecimal
CGI
Complex
Coverage
CSV
Curses
Date
DateTime
DBM
Delegator
Digest::MD5
Digest::SHA1
DRb
ERB
Fiber
Fiddle
FileUtils
Find
Forwardable
GetoptLong
GServer
IPAddr
IRB
JSON
Logger
Matrix
MiniTest
Monitor
Net::FTP
Net::HTTP
Net::IMAP
Net::POP3
Net::SMTP
Net::Telnet
NKF
Observable
OpenURI
Open3
OpenSSL
OptionParser
OpenStruct
Pathname
PP
PrettyPrint
Prime
PStore
PTY
Readline
REXML
Rinda
Ripper
RSS
Set
Shellwords
Singleton
TCPServer
TCPSocket
UDPSocket
StringIO
StringScanner
Syslog
Tempfile
Test::Unit
Thread
ThreadsWait
Time
Timeout
Tk
Tracer
TSort
URI
WeakRef
WEBrick
WIN32OLE
XMLRPC::Client
XMLRPC::Server
YAML
ZLib


### Gems

Screenshot of rubygems.org

ruby-toolbox categories:

Active Record Plugins
Background Processing
Code Quality
Communication
Content Management & Blogging
CSS
Data Persistence
Developer Tools
Documentation Tools
Documents & Reports
E-Commerce and Payments
Fun
Graphics
HTML & Markup
JavaScript
Maintenance & Monitoring
Package & Dependency Management
Provision, Deploy & Host
Rails Plugins
Security
Testing
Time & Space
Web Apps, Services & Interaction

Screenshot of installing Sinatra



## Setup

* Install Ruby
** ruby-lang.org
* Install Sinatra
** "gem install sinatra"
** "sudo gem install sinatra"
* A text editor



# Syntax basics

## Variables

```ruby
title = "Jaws"
puts title
```

## Calling methods

```ruby
puts("Jaws")
puts "Jaws"
```

## Defining methods

```ruby
def square(number)
  number * number
end

puts square(2)
puts square(5)
```

## Blocks

```ruby
def system_date
  puts "Please wait..."
  system("date")
  puts "Run complete!"
end

system_date

def google_page_size
  puts "Please wait..."
  system("curl www.google.com | wc")
  puts "Run complete!"
end

google_page_size
```

```ruby
def run_process
  puts "Please wait..."
  yield
  puts "Run complete!"
end

run_process { system("date") }
run_process { system("curl www.google.com | wc") }
```

```ruby
def run_process
  puts "Please wait..."
  yield
  puts "Run complete!"
end

run_process do
  system("date")
end

run_process do
  system("curl www.google.com | wc")
end
```

## Classes

```ruby
class Movie
  def title
    "Jaws"
  end
end

movie = Movie.new
puts movie.title
```

## Instance variables

```ruby
class Movie
  def set_title # This is nonstandard!
    @title = "Jaws"
  end
  def get_title # Also nonstandard!
    @title
  end
end

movie = Movie.new
movie.set_title
puts movie.get_title
```

## Accessor methods

```ruby
class Movie
  def title=(value)
    @title = value
  end
  def title
    @title
  end
end

movie = Movie.new
movie.title = "Jaws"
puts movie.title
```

Or use `attr_accessor`:

```ruby
class Movie
  attr_accessor :title
end

movie = Movie.new
movie.title = "Jaws"
puts movie.title
```

```ruby
class Movie
  attr_accessor :title, :director, :year, :id
end

movie = Movie.new
movie.id = 1
movie.title = "Jaws"
movie.director = "Steven Spielberg"
movie.year = 1977
puts movie.id, movie.title, movie.director, movie.year
```

# Core classes

## Array

```ruby
movies = ["The Matrix", "Alien", "Jaws"]
p movies[0]
p movies[2]
```

```ruby
movies = ["The Matrix", "Alien", "Jaws"]
p movies
movies.push("Fight Club")
p movies
p movies.shift
p movies
```

```ruby
movies = ["The Matrix", "Alien", "Jaws"]
p movies.include?("Jaws")
p movies.find_index("Alien")
```

```ruby
movies = ["The Matrix", "Alien", "Jaws"]

index = 0
while index < movies.length
  puts "Title: #{movies[index]}"
  index += 1
end

shortest_title = movies.first
index = 0
while index < movies.length
  if movies[index].length < shortest_title.length
    shortest_title = movies[index]
  end
  index += 1
end
puts "Shortest title: #{shortest_title}"
```

```ruby
movies = ["The Matrix", "Alien", "Jaws"]

movies.each do |movie|
  puts "Title: #{movie}"
end

shortest_title = movies.first
movies.each do |movie|
  if movie.length < shortest_title.length
    shortest_title = movie
  end
end
puts "Shortest title: #{shortest_title}"
```

```ruby
# There are actually specialized methods available on Array
# that can make your code still shorter.
movies = ["The Matrix", "Alien", "Jaws"]

print "Shortest title: "
puts movies.min_by{ |title| title.length }
```

Look up the docs for the Array class (and the Enumerable module that's mixed in to Array) for a list of the available methods.

## Hash

```ruby
directors = {
  "Fight Club" => "David Fincher",
  "Jaws" => "Steven Spielberg",
  "Alien" => "Ridley Scott"
}
p directors["Fight Club"]
p directors["Jaws"]
```

```ruby
directors = {
  "Jaws" => "Steven Spielberg",
  "Alien" => "Ridley Scott"
}
p directors
directors["Star Wars"] = "George Lucas"
p directors
directors.delete("Alien")
p directors
```

Again, look up the docs for the Hash class (and the Enumerable module that's mixed in to Hash) for a list of the available methods.

## File

```text
Normally producers and directors would stop this kind of garbage from getting published. Truncated is amazing in that it got past those hurdles.
--Joseph Goldstein, "Truncated: Awful," New York Minute
Guppies is destined to be the family film favorite of the summer.
--Bill Mosher, "Go see Guppies," Topeka Obscurant
Truncated is funny: it can't be categorized as comedy, romance, or horror, because none of those genres would want to be associated with it.
--Liz Smith, "Truncated Disappoints," Chicago Some-Times
I'm pretty sure this was shot on a mobile phone. Truncated is astounding in its disregard for filmmaking aesthetics.
--Bill Mosher, "Don't See Truncated," Topeka Obscurant
```

```ruby
File.foreach("reviews.txt") do |line|
  puts line
end
```

```ruby
File.foreach("reviews.txt") do |line|
  puts line if line.include?("Truncated")
end
```

```ruby
lines = []
File.open("reviews.txt") do |file|
  lines = file.readlines
end
puts lines.sort
```


# Standard Library

## CSV

```csv
Associate,Sale Count,Sales Total
"Boone, Agnes",127,1710.26
"Howell, Marvin",196,2245.19
"Rodgers, Tonya",400,3032.48
"Pearson, Cameron",59,68.60
"Wood, Jeff",398,2684.81
"Watts, Harold",69,3135.39
"Richardson, Darlene",101,2046.86
"Arnold, Roman",246,3337.71
"Walton, Eula",235,2028.20
"Lloyd, Cornelius",77,910.62
"Perez, Amber",107,1190.69
"Chapman, Delbert",307,2944.45
"Ramos, Ruben",133,1340.64
```

```ruby
require "csv"

CSV.foreach("sales.csv") do |row|
  p row
end
```

```ruby
require "csv"

puts format("%20s %s", "Associate", "Average Sale")
CSV.foreach("sales.csv", headers: true) do |row|
  average_value = row['Sales Total'].to_f / row['Sale Count'].to_i
  puts format("%20s $%.2f", row["Associate"], average_value)
end
```

## ERB

```erb
<%= number %> bottle<% if number > 1 %>s<% end %> of beer on the wall,
<%= number %> bottle<% if number > 1 %>s<% end %> of beer,
You take one down,
Pass it around,
<%= number - 1 %> bottle<% if (number - 1) != 1 %>s<% end %> of beer on the wall.
```

```ruby
require 'erb'

erb_string = File.read('bottles.erb')
erb = ERB.new(erb_string)
99.downto(1) do |number|
  puts erb.result(binding)
end
```

## YAML

```ruby
class Movie
  attr_accessor :title, :director, :year, :id
end
```

```ruby
require "yaml"
require "movie"

movie = Movie.new
movie.title = "Jaws"
movie.director = "Steven Spielberg"
movie.year = 1977
puts YAML.dump(movie)
```

```ruby
require "yaml/store"
require "movie"

movie = Movie.new
movie.title = "Jaws"
movie.director = "Steven Spielberg"
movie.year = 1977
store = YAML::Store.new("test.yml")
store.transaction do
  store["Jaws"] = movie
end
```

```ruby
require "yaml/store"
require "movie"

store = YAML::Store.new("test.yml")
store.transaction do
  movie = store["Jaws"]
  puts movie.title, movie.director, movie.year
end
```

# Gems

## lolcat

```shell
gem install lolcat
lolcat lorem_ipsum.txt
```

## Rails

```shell
$ gem install rails
Fetching: i18n-0.7.0.gem (100%)
Successfully installed i18n-0.7.0
Fetching: minitest-5.8.4.gem (100%)
Successfully installed minitest-5.8.4
Fetching: thread_safe-0.3.5.gem (100%)
Successfully installed thread_safe-0.3.5
Fetching: tzinfo-1.2.2.gem (100%)
Successfully installed tzinfo-1.2.2
Fetching: activesupport-4.2.5.gem (100%)
Successfully installed activesupport-4.2.5
Fetching: builder-3.2.2.gem (100%)
Successfully installed builder-3.2.2
Fetching: erubis-2.7.0.gem (100%)
Successfully installed erubis-2.7.0
Fetching: mini_portile2-2.0.0.gem (100%)
Successfully installed mini_portile2-2.0.0
Fetching: nokogiri-1.6.7.2.gem (100%)
Building native extensions.  This could take a while...
Successfully installed nokogiri-1.6.7.2
Fetching: rails-deprecated_sanitizer-1.0.3.gem (100%)
Successfully installed rails-deprecated_sanitizer-1.0.3
Fetching: rails-dom-testing-1.0.7.gem (100%)
Successfully installed rails-dom-testing-1.0.7
Fetching: loofah-2.0.3.gem (100%)
Successfully installed loofah-2.0.3
Fetching: rails-html-sanitizer-1.0.2.gem (100%)
Successfully installed rails-html-sanitizer-1.0.2
Fetching: actionview-4.2.5.gem (100%)
Successfully installed actionview-4.2.5
Fetching: rack-1.6.4.gem (100%)
Successfully installed rack-1.6.4
Fetching: rack-test-0.6.3.gem (100%)
Successfully installed rack-test-0.6.3
Fetching: actionpack-4.2.5.gem (100%)
Successfully installed actionpack-4.2.5
Fetching: globalid-0.3.6.gem (100%)
Successfully installed globalid-0.3.6
Fetching: activejob-4.2.5.gem (100%)
Successfully installed activejob-4.2.5
Fetching: mime-types-2.99.gem (100%)
Successfully installed mime-types-2.99
Fetching: mail-2.6.3.gem (100%)
Successfully installed mail-2.6.3
Fetching: actionmailer-4.2.5.gem (100%)
Successfully installed actionmailer-4.2.5
Fetching: activemodel-4.2.5.gem (100%)
Successfully installed activemodel-4.2.5
Fetching: arel-6.0.3.gem (100%)
Successfully installed arel-6.0.3
Fetching: activerecord-4.2.5.gem (100%)
Successfully installed activerecord-4.2.5
Fetching: bundler-1.11.2.gem (100%)
Successfully installed bundler-1.11.2
Fetching: thor-0.19.1.gem (100%)
Successfully installed thor-0.19.1
Fetching: railties-4.2.5.gem (100%)
Successfully installed railties-4.2.5
Fetching: concurrent-ruby-1.0.0.gem (100%)
Successfully installed concurrent-ruby-1.0.0
Fetching: sprockets-3.5.2.gem (100%)
Successfully installed sprockets-3.5.2
Fetching: sprockets-rails-3.0.0.gem (100%)
Successfully installed sprockets-rails-3.0.0
Fetching: rails-4.2.5.gem (100%)
Successfully installed rails-4.2.5
Parsing documentation for i18n-0.7.0
32 gems installed
```

```shell
$ rails new movies
      create
      create  README.rdoc
      create  Rakefile
      create  config.ru
      create  .gitignore
      create  Gemfile
      create  app
      create  app/assets/javascripts/application.js
      create  app/assets/stylesheets/application.css
      create  app/controllers/application_controller.rb
      create  app/helpers/application_helper.rb
      create  app/views/layouts/application.html.erb
      create  app/assets/images/.keep
      create  app/mailers/.keep
      create  app/models/.keep
      create  app/controllers/concerns/.keep
      create  app/models/concerns/.keep
      create  bin
      create  bin/bundle
      create  bin/rails
      create  bin/rake
      create  bin/setup
      create  config
      create  config/routes.rb
      create  config/application.rb
      create  config/environment.rb
      create  config/secrets.yml
      create  config/environments
      create  config/environments/development.rb
      create  config/environments/production.rb
      create  config/environments/test.rb
      create  config/initializers
      create  config/initializers/assets.rb
      create  config/initializers/backtrace_silencers.rb
      create  config/initializers/cookies_serializer.rb
      create  config/initializers/filter_parameter_logging.rb
      create  config/initializers/inflections.rb
      create  config/initializers/mime_types.rb
      create  config/initializers/session_store.rb
      create  config/initializers/wrap_parameters.rb
      create  config/locales
      create  config/locales/en.yml
      create  config/boot.rb
      create  config/database.yml
      create  db
      create  db/seeds.rb
      create  lib
      create  lib/tasks
      create  lib/tasks/.keep
      create  lib/assets
      create  lib/assets/.keep
      create  log
      create  log/.keep
      create  public
      create  public/404.html
      create  public/422.html
      create  public/500.html
      create  public/favicon.ico
      create  public/robots.txt
      create  test/fixtures
      create  test/fixtures/.keep
      create  test/controllers
      create  test/controllers/.keep
      create  test/mailers
      create  test/mailers/.keep
      create  test/models
      create  test/models/.keep
      create  test/helpers
      create  test/helpers/.keep
      create  test/integration
      create  test/integration/.keep
      create  test/test_helper.rb
      create  tmp/cache
      create  tmp/cache/assets
      create  vendor/assets/javascripts
      create  vendor/assets/javascripts/.keep
      create  vendor/assets/stylesheets
      create  vendor/assets/stylesheets/.keep
         run  bundle install
Fetching gem metadata from https://rubygems.org/...........
Fetching version metadata from https://rubygems.org/...
Fetching dependency metadata from https://rubygems.org/..
Resolving dependencies....
Installing rake 10.5.0
Using i18n 0.7.0
Installing json 1.8.3 with native extensions
Using minitest 5.8.4
Using thread_safe 0.3.5
Using builder 3.2.2
Using erubis 2.7.0
Using mini_portile2 2.0.0
Using rack 1.6.4
Using mime-types 2.99
Using arel 6.0.3
Installing debug_inspector 0.0.2 with native extensions
Using bundler 1.11.2
Installing byebug 8.2.1 with native extensions
Installing coffee-script-source 1.10.0
Installing execjs 2.6.0
Using thor 0.19.1
Using concurrent-ruby 1.0.0
Installing multi_json 1.11.2
Installing sass 3.4.21
Installing tilt 2.0.2
Installing spring 1.6.2
Installing sqlite3 1.3.11 with native extensions
Installing rdoc 4.2.1
Using tzinfo 1.2.2
Using nokogiri 1.6.7.2
Using rack-test 0.6.3
Using mail 2.6.3
Installing binding_of_caller 0.7.2 with native extensions
Installing coffee-script 2.4.1
Installing uglifier 2.7.2
Using sprockets 3.5.2
Installing sdoc 0.4.1
Using activesupport 4.2.5
Using loofah 2.0.3
Using rails-deprecated_sanitizer 1.0.3
Using globalid 0.3.6
Using activemodel 4.2.5
Installing jbuilder 2.4.0
Using rails-html-sanitizer 1.0.2
Using rails-dom-testing 1.0.7
Using activejob 4.2.5
Using activerecord 4.2.5
Using actionview 4.2.5
Using actionpack 4.2.5
Using actionmailer 4.2.5
Using railties 4.2.5
Using sprockets-rails 3.0.0
Installing coffee-rails 4.1.1
Installing jquery-rails 4.1.0
Using rails 4.2.5
Installing sass-rails 5.0.4
Installing web-console 2.2.1
Installing turbolinks 2.5.3
Bundle complete! 12 Gemfile dependencies, 54 gems now installed.
Use `bundle show [gemname]` to see where a bundled gem is installed.
Post-install message from rdoc:
Depending on your version of ruby, you may need to install ruby rdoc/ri data:

<= 1.8.6 : unsupported
 = 1.8.7 : gem install rdoc-data; rdoc-data --install
 = 1.9.1 : gem install rdoc-data; rdoc-data --install
>= 1.9.2 : nothing to do! Yay!
         run  bundle exec spring binstub --all
* bin/rake: spring inserted
* bin/rails: spring inserted
$ cd movies
```

```shell
$ cd movies
$ rails generate scaffold movie title:string director:string year:integer
Running via Spring preloader in process 81089
      invoke  active_record
      create    db/migrate/20160125071519_create_movies.rb
      create    app/models/movie.rb
      invoke    test_unit
      create      test/models/movie_test.rb
      create      test/fixtures/movies.yml
      invoke  resource_route
       route    resources :movies
      invoke  scaffold_controller
      create    app/controllers/movies_controller.rb
      invoke    erb
      create      app/views/movies
      create      app/views/movies/index.html.erb
      create      app/views/movies/edit.html.erb
      create      app/views/movies/show.html.erb
      create      app/views/movies/new.html.erb
      create      app/views/movies/_form.html.erb
      invoke    test_unit
      create      test/controllers/movies_controller_test.rb
      invoke    helper
      create      app/helpers/movies_helper.rb
      invoke      test_unit
      invoke    jbuilder
      create      app/views/movies/index.json.jbuilder
      create      app/views/movies/show.json.jbuilder
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/movies.coffee
      invoke    scss
      create      app/assets/stylesheets/movies.scss
      invoke  scss
      create    app/assets/stylesheets/scaffolds.scss
```

```shell
$ rake db:migrate
== 20160123001802 CreateMovies: migrating =====================================
-- create_table(:movies)
   -> 0.0007s
== 20160123001802 CreateMovies: migrated (0.0008s) ============================

```

```shell
$ rails server
=> Booting WEBrick
=> Rails 4.2.5 application starting in development on http://localhost:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
[2016-01-22 17:30:07] INFO  WEBrick 1.3.1
[2016-01-22 17:30:07] INFO  ruby 2.2.3 (2015-08-18) [x86_64-darwin14]
[2016-01-22 17:30:07] INFO  WEBrick::HTTPServer#start: pid=50605 port=3000


Started GET "/" for ::1 at 2016-01-22 17:30:10 -0700
  ActiveRecord::SchemaMigration Load (0.1ms)  SELECT "schema_migrations".* FROM "schema_migrations"
Processing by Rails::WelcomeController#index as HTML
  Rendered /Users/jay/.rvm/gems/ruby-2.2.3@rails/gems/railties-4.2.5/lib/rails/templates/rails/welcome/index.html.erb (1.1ms)
Completed 200 OK in 14ms (Views: 7.1ms | ActiveRecord: 0.0ms)


Started GET "/movies" for ::1 at 2016-01-22 17:30:15 -0700
Processing by MoviesController#index as HTML
  Movie Load (0.1ms)  SELECT "movies".* FROM "movies"
  Rendered movies/index.html.erb within layouts/application (1.7ms)
Completed 200 OK in 1075ms (Views: 1072.7ms | ActiveRecord: 0.2ms)
```



## Sinatra

```shell
$ gem install sinatra
Fetching: rack-1.6.4.gem (100%)
Successfully installed rack-1.6.4
Fetching: rack-protection-1.5.3.gem (100%)
Successfully installed rack-protection-1.5.3
Fetching: tilt-2.0.2.gem (100%)
Successfully installed tilt-2.0.2
Fetching: sinatra-1.4.6.gem (100%)
Successfully installed sinatra-1.4.6
Parsing documentation for rack-1.6.4
Installing ri documentation for rack-1.6.4
Parsing documentation for rack-protection-1.5.3
Installing ri documentation for rack-protection-1.5.3
Parsing documentation for tilt-2.0.2
Installing ri documentation for tilt-2.0.2
Parsing documentation for sinatra-1.4.6
Installing ri documentation for sinatra-1.4.6
Done installing documentation for rack, rack-protection, tilt, sinatra after 196 seconds
4 gems installed
```

```ruby
require 'sinatra'

get('/hello') do
  'Hello, web!'
end
```

```ruby
require 'sinatra'

get('/hello') do
  'Hello, web!'
end

get('/namaste') do
  'Namaste, web!'
end
```

TODO 05_looping/ cat movies.yml; execute test_movie_store.rb
