require 'sinatra'

get('/time') do
  Time.now.to_s
end
