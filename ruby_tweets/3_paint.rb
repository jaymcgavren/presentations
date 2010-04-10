#ruby -rtk -e "w=TkCanvas.new(TkRoot.new{title:paint});w.pack.bind('B1-Motion',proc{|x,y|TkcOval.new(w,x,y,x+4,y+4)},'%x %y').mainloop" #ruby

require 'tk'

window = TkRoot.new{title:paint}
canvas = TkCanvas.new(window)
canvas.pack
canvas.bind(
  'B1-Motion',
  proc{ |x,y|
    TkcOval.new(
      canvas,
      x,y,
      x+4,y+4
    )
  },
  '%x %y'
)
canvas.mainloop