require 'rinda/rinda'
MY_URI = ARGV[0] || "druby://127.0.0.1:7632"
DRb.start_service 
space = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, MY_URI)) 
queries = [[ "*", 5, 2 ], [ "/", 3, 4 ], [ "+", 8, 2 ]] 
queries.each do |q|
  space.write(q)
  ans = space.take(["result", nil])
  puts "#{q[1]} #{q[0]} #{q[2]} = #{ans[1]}"
end
