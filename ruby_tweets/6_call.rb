##ruby -e'def f(o);o.methods.each{|n|m = o.method(n);puts %Q/#{m}:#{m[*[o]*m.arity.abs]}/ rescue 1};end;f 1;f "r";f [1]*9;f({:a=>1});f 1..9'

def f(o)
  o.methods.each{ |method_name|
    method = o.method(method_name)
    argument_count = method.arity
    #negative if argument count is variable
    argument_count = argument_count.abs
    #Try to pass object to its own method as arguments
    arguments = [o] * argument_count
    result = method.call(*arguments) rescue 'fail'
    puts "#{method}: #{result}"
  }
end

f(1)
f("r")
f([1]*9)
f({:a=>1})
f(1..9)
