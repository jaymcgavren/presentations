require 'rinda/rinda'
MY_URI = ARGV[0] || "druby://127.0.0.1:7632"
DRb.start_service 
space = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, MY_URI)) 
STDIN.each {|line| space.write(["String", line])}
