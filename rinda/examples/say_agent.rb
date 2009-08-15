#OS X only.
require 'rinda/rinda' 
MY_URI = ARGV[0] || "druby://127.0.0.1:9999"
DRb.start_service
space = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, MY_URI))
loop do
  key, value = space.take([/String/, String])
  value.gsub!(/[^\w\s]/, '') #For safety.
  `say #{value}` unless value.nil? or value.length < 1 or value =~ /^\s*$/
end
