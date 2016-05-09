require 'sinatra'
require 'movie'

get('/movies') do
  @movie = Movie.new
  @movie.title = "Jaws"
  erb :index
end
