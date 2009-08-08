require 'yaml'

array = ['an', 'array', 
  ['of', 'arrays']]
hash = {
  :a => 'hash',
  :of => {
    :hashes => {:of => 'hashes'}
  }
}

puts YAML.dump(array)
puts YAML.dump(hash)
