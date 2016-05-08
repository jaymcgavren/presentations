File.foreach("reviews.txt") do |line|
  puts line if line.include?("Truncated")
end
