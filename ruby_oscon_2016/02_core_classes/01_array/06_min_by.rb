# There are actually specialized methods available on Array
# that can make your code still more concise.
movies = ["The Matrix", "Alien", "Jaws"]

print "Shortest title: "
puts movies.min_by{ |title| title.length }
