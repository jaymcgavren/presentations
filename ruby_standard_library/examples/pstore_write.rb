require 'animal'
require 'pstore'
store = PStore.new('storage.bin')
store.transaction do
  store['cat'] = Animal.new('meow')
  store['dog'] = Animal.new('woof')
end

puts File.open('storage.bin').readlines
