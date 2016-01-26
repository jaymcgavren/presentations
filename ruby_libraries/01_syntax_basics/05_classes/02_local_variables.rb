class Movie
  def set_title
    title = "Jaws"
  end
  def get_title
    title
  end
end

movie = Movie.new
movie.set_title
# Fails with an error!
puts movie.get_title
