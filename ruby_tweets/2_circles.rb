# a=[1]*9;c=TkCanvas.new;c.pack.bind('B1-Motion',proc{|x,y|a<<TkcOval.new(c,x,y,y,x);a.shift.delete rescue 1},'%x %y').mainloop

require 'tk'

a=[1]*9
c=TkCanvas.new
c.pack
c.bind(
  'B1-Motion',
  proc{|x,y|
    a<<TkcOval.new(c,x,y,y,x);
    a.shift.delete rescue 1
  },
  '%x %y'
)
c.mainloop
