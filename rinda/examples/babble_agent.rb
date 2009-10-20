require 'rubygems'
require 'babble'
require 'rinda/rinda' 
MY_URI = ARGV[0] || "druby://127.0.0.1:7632"
DRb.start_service 
space = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, MY_URI))
loop do
  key, value = space.take([/String/, String])
  puts Babble.scramble_text(value)
end
