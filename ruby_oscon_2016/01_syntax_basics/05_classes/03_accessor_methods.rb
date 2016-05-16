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
