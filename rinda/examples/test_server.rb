require 'rinda/tuplespace' 
MY_URI = ARGV[0] || "druby://127.0.0.1:7632"
DRb.start_service(MY_URI, Rinda::TupleSpace.new) 
DRb.thread.join
