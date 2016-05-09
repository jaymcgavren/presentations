def access_fridge
  puts "Opening refrigerator."
  yield "guacamole"
  puts "Closing refrigerator."
end

access_fridge do |contents|
  puts "You see #{contents}..."
  puts "But you really shouldn't eat that."
end

access_fridge do |contents|
  puts "You can no longer resist."
  puts "You devour the #{contents}."
end
