lines = []
File.open("reviews.txt") do |file|
  lines = file.readlines
end
puts lines.sort
