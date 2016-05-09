require 'movie'
require 'movie_store'

store = MovieStore.new('movies.yml')

puts "store.all:"
movies = store.all
movies.each do |movie|
  p movie
end

puts "store.find(2):"
p store.find(2)
