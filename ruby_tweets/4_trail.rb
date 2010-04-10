# ruby -rtk -e"v,w=0,0;a=[1]*9;c=TkCanvas.new;c.pack.bind('Motion',proc{|x,y|a<<TkcLine.new(c,v,w,v=x,w=y,:arrow=>'last');a.shift.delete rescue 1},'%x %y').mainloop"

require 'tk'

v,w = 0,0
lines = [1] * 9
canvas = TkCanvas.new
canvas.pack
canvas.bind(
  'Motion',
  proc{ |x,y|
    lines << TkcLine.new(
      canvas,
      v, w,
      v=x, w=y,
      :arrow=>'last'
    )
    #Rescue is for when we call 1.delete
    lines.shift.delete rescue 1
  },
  '%x %y'
)
canvas.mainloop
