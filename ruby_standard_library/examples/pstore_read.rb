require 'animal'
require 'pstore'
store = PStore.new('storage.bin')
store.transaction do
  store.roots.each do |name|
    puts "the #{name} says:"
    store[name].speak
  end
end
