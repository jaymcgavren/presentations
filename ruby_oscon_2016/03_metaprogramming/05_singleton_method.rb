my_string = "ruby is so cool"

def my_string.sort_words
  self.split(' ').sort.join(' ')
end

puts my_string.sort_words
"don't have this method".sort_words
