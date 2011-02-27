require "ruboto.rb"
confirm_ruboto_version(4, false)
java_import "org.ruboto.embedded.RubotoView"
java_import "android.util.Log"
java_import "android.view.KeyEvent"

require 'drb'
DRb.start_service

$activity.start_ruboto_activity "$druby" do

  setup_content do
puts "start of setup_content"
    @service = DRbObject.new(nil, "druby://localhost:9000")
    # @service.text_font @service.create_font "Courier", 72, true
    view = RubotoView.new($druby)
    request_callback CB_KEY
    view.on_key_listener = self
    view
  end
  
  handle_touch_event do |event|
    @old_touch_location ||= [event.get_x, event.get_y]
    @service.stroke 0, 0, 0, 200
    @service.stroke_weight 30
    @service.line @old_touch_location[0], @old_touch_location[1], event.get_x, event.get_y
    @old_touch_location = [event.get_x, event.get_y]
  end
  
  handle_key do |view, key_code, event|
    @old_text_location ||= [10, 10]
Log.d "RUBOTO", "#{view} #{key_code} #{event}"
puts "#{view} #{key_code} #{event}"
    if key_code >= KeyEvent::KEYCODE_A && key_code >= KeyEvent::KEYCODE_Z
      letter = (key_code - KeyEvent::KEYCODE_A + 65).chr
Log.d "RUBOTO", letter
puts letter
      @service.text letter, @old_text_location[0], @old_text_location[1]
      @old_text_location = advance_text(@old_text_location)
    end
  end

end

def advance_text(location); [location[0] + 74, location[1]]; end
