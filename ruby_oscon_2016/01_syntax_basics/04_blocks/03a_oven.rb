# Refactor the bake_pie and get_pie methods into a single method,
# named with_oven. In place of "inserting pie" or "removing pie",
# with_oven should yield to a block.

def bake_pie
  puts "Opening oven."
  puts "Inserting pie."
  puts "Closing oven."
end

def get_pie
  puts "Opening oven."
  puts "Removing pie."
  puts "Closing oven."
end

bake_pie
get_pie
