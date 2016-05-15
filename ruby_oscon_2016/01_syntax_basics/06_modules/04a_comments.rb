module AcceptsComments
  def comments
    @comments ||= []
  end
  def add_comment(comment)
    comments << comment
  end
end
# Include the AcceptsComments module in both the Movie and
# Director classes below, so that the following code works.
class Movie
  attr_accessor :title
end
class Director
  attr_accessor :name
end

movie = Movie.new
movie.title = "Armageddon"
movie.add_comment("OMG WTF")
movie.add_comment("Wow, just wow.")
p movie.comments

director = Director.new
director.name = "Michael Bay"
director.add_comment("More explosions!")
p director.comments
