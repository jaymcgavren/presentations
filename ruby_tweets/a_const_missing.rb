# def Object.const_missing(c);ObjectSpace.each_object(Module){|m|return m if m.name=~/^#{c}/};end
def Object.const_missing(n);Module.const_get Module.constants.find{|c|c=~/^#{n}/};end

require 'tk'

c=TkCan.new.pack
a=[c,0,0,99,99]
[TkcA,TkcL,TkcO,TkcR].each{|t|t.new *a}
c.mainloop
