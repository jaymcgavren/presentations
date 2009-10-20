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
      :title => "Click and Drag"
    )
    frame.evt_close {exit}
    frame.evt_motion {|event| on_mouse_motion(event)}
    frame.evt_left_down {|event| on_mouse_press(event)}
    frame.evt_left_up {|event| on_mouse_release(event)}
    frame.show
  end
    
  def on_mouse_motion(event)
    return unless event.dragging
    space.write [:x, event.x], TIME_TO_LIVE
    space.write [:y, event.y], TIME_TO_LIVE
  end

  def on_mouse_press(event); end
  def on_mouse_release(event); end

end

client = MouseClient.new

DRb.start_service 
client.space = Rinda::TupleSpaceProxy.new(DRbObject.new(nil, MY_URI))
client.main_loop
