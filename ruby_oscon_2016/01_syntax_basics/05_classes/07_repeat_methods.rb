class Movie
  attr_accessor :title, :director
  # And maybe other repeated methods, too...
end

class TvSeries
  attr_accessor :title, :director
  # And maybe other repeated methods, too...
end

movie = Movie.new
movie.title = "Jaws"
puts movie.title

series = TvSeries.new
series.title = "Game of Thrones"
puts series.title
