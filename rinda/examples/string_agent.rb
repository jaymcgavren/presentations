require 'rinda/rinda' 
MY_URI = ARGV[0] || "druby://127.0.0.1:9999"
DRb.start_service 
space = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, MY_URI))
loop do
  key, value = space.take([/String/, String])
  puts value
  sleep 5
end
