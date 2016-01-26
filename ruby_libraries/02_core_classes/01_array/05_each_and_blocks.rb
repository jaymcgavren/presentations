movies = ["The Matrix", "Alien", "Jaws"]

movies.each do |movie|
  puts "Title: #{movie}"
end

shortest_title = movies.first
movies.each do |movie|
  if movie.length < shortest_title.length
    shortest_title = movie
  end
end
puts "Shortest title: #{shortest_title}"
