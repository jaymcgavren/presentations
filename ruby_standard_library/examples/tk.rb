require 'tk'

canvas = TkCanvas.new(
  :width => 400,
  :height => 400
)
canvas.pack

radius=200
a = 0
3000.times do
  x = radius * Math.sin(a) + radius
  y = radius * Math.cos(a) * Math.sin(0.9 * a) + radius
  TkcOval.new(canvas, x, y, x + 9, y + 9)
  a += 0.03
end

canvas.mainloop
