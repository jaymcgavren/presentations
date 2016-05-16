class Movie
  attr_accessor :title, :director, :year, :id
end

movie = Movie.new
movie.id = 1
movie.title = "Jaws"
movie.director = "Steven Spielberg"
movie.year = 1977
puts movie.id, movie.title, movie.director, movie.year
