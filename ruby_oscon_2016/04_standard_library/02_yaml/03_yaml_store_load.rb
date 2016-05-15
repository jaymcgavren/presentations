require "yaml/store"
require "movie"

store = YAML::Store.new("test.yml")
store.transaction do
  movie = store["Jaws"]
  puts movie.title, movie.director, movie.year
end
