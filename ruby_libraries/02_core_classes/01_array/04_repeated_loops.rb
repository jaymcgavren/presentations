movies = ["The Matrix", "Alien", "Jaws"]

index = 0
while index < movies.length
  puts "Title: #{movies[index]}"
  index += 1
end

shortest_title = movies.first
index = 0
while index < movies.length
  if movies[index].length < shortest_title.length
    shortest_title = movies[index]
  end
  index += 1
end
puts "Shortest title: #{shortest_title}"
