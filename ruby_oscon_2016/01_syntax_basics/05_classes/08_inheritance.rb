class VideoPublication
  attr_accessor :title, :director
end

class Movie < VideoPublication
end

class TvSeries < VideoPublication
end

movie = Movie.new
movie.title = "Jaws"
puts movie.title

series = TvSeries.new
series.title = "Game of Thrones"
puts series.title
