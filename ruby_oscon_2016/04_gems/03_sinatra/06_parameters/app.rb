require 'sinatra'
require 'movie'
require 'movie_store'

store = MovieStore.new('movies.yml')

get('/movies') do
  @movies = store.all
  erb :index
end

get('/movies/:id') do
  id = params['id'].to_i
  @movie = store.find(id)
  erb :show
end
