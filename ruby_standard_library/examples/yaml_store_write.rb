require 'animal'
require 'yaml/store'
store = YAML::Store.new('storage.txt')
store.transaction do
  store['cat'] = Animal.new('meow')
  store['dog'] = Animal.new('woof')
end

puts File.open('storage.txt').readlines
