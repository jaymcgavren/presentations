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
