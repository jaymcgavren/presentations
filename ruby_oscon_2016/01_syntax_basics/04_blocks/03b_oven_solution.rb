def with_oven
  puts "Opening oven."
  yield
  puts "Closing oven."
end

with_oven { puts "Inserting pie." }

with_oven do
  puts "Removing pie."
end
