# ruby -e "def method_missing(*m);s=m.shift;method(methods.find{|n|n=~/^#{s}/})[*m];end;p 'XXzAzTTzq'.rev.sp(/z/).map{|l|l.sq.suc}.jo.sw"

#Re-define Object.method_missing().
def method_missing(*m)

  #The symbol for the failed method call.
  shorthand = m.shift
  
  #Arguments, if any, follow the method name.
  arguments = m
  
  #methods() gives all defined method names for the current object.
  method_names = methods
  
  #Find the first method where the shorthand matches the start of its name.
  #You'll have to supply enough of the method name to ensure it's unique.
  #Otherwise, you could call a different method with a similar name.
  full_method_name = method_names.find do |name|
    name =~ /^#{shorthand}/
  end
  
  #method() gives the actual method reference, given the name.
  method_reference = method(full_method_name)
  
  #Splatting the argument array ensures that if it's empty,
  #the methods will be called with no arguments.
  method_reference.call(*arguments)
  
end

p 'XXzAzTTzq'.
  rev. #String#reverse()
  sp(/z/). #String#split()
  map{|l| #Array#map()
    l. #['q', 'TT', 'A', XX], in order
    sq. #String#squeeze()
    suc #String#succ()
  }.
  jo. #Array#join('')
  sw #String#swapcase()
