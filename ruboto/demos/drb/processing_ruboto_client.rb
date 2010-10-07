require "ruboto.rb"
confirm_ruboto_version(4, false)
java_import "org.ruboto.embedded.RubotoView"

require 'drb'
DRb.start_service

$activity.start_ruboto_activity "$druby" do

  setup_content do
    @service = DRbObject.new(nil, "druby://localhost:9000")
    RubotoView.new($druby)
  end
  
  handle_touch_event do |event|
    @old_touch_location ||= [event.get_x, event.get_y]
    @service.fill 0, 0, 0, 200
    @service.ellipse(
      event.get_x, event.get_y,
      event.get_x + 30, event.get_y + 30
    )
    true
  end
  
end
