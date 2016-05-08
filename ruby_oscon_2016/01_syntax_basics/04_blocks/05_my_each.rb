titles = ['Star Wars', 'Jaws','Fight Club']

directors = ['George Lucas', 'Steven Spielberg', 'David Fincher']

def each_item(array)
  index = 0
  while index < array.length
    yield array[index]
    index += 1
  end
end

puts "titles:"

each_item(titles) do |title|
  puts title
end

puts "\ndirectors:"

each_item(directors) do |director|
  puts director
end
