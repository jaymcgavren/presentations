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
