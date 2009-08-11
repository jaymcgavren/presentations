require 'rinda/rinda'
MY_URI = ARGV[0] || "druby://127.0.0.1:9999"
DRb.start_service
space = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, MY_URI)) 

def scale(value)
  @largest_seen = value if @largest_seen == nil or value > @largest_seen
  value.to_f / @largest_seen
end

loop do
  key, value = space.take([/Integer/, Integer])
  puts "#{key}: #{'|' * (scale(value) * 68.0)}"
end
