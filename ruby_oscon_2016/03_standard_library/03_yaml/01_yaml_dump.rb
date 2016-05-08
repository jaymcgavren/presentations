require "yaml"
require "movie"

movie = Movie.new
movie.title = "Jaws"
movie.director = "Steven Spielberg"
movie.year = 1977
puts YAML.dump(movie)
