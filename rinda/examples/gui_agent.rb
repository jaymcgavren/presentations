require 'rubygems'
require 'wx'
require 'rinda/rinda'

MY_URI = ARGV[0] || "druby://127.0.0.1:7632"
TIME_TO_LIVE = 10

class MouseClient < Wx::App

  attr_accessor :space

  def on_init
    frame = Wx::Frame.new(
      nil, #No parent.
      :size => [640, 480],
      :title => "X/Y Agent"
    )
    frame.evt_close {exit}
    drawing_area = Wx::Window.new(frame)
    frame.show
    timer = Wx::Timer.new(self, 55)
    evt_timer(55) do
      drawing_area.paint do |dc|
        dc.pen = Wx::Pen.new(Wx::Colour.new(128, 128, 128), 1)
        dc.draw_circle(
          space.take([/^Integer:x$/, nil]).last,
          space.take([/^Integer:y$/, Integer]).last,
          50
        )
      end
    end
    timer.start(33)
  end

end

client = MouseClient.new

DRb.start_service 
client.space = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, MY_URI))
client.main_loop
