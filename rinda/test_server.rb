require 'rinda/tuplespace' 
MY_URI = ARGV[0] || "druby://127.0.0.1:9999"
DRb.start_service(MY_URI, Rinda::TupleSpace.new) 
DRb.thread.join
