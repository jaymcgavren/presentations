require 'rinda/rinda' 
MY_URI = ARGV[0] || "druby://127.0.0.1:7632"
DRb.start_service 
space = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, MY_URI)) 
loop do 
  op, v1, v2 = space.take([ %r{^[-+/*]$}, Numeric, Numeric]) 
  space.write(["result", v1.send(op, v2)]) 
end 
