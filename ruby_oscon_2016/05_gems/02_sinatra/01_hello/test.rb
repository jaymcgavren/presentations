require 'sinatra'

get('/time') do
  Time.new.to_s
end

get('/hello') do
  "Hello!"
end
