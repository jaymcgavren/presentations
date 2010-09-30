!SLIDE subsection center
#DRb


!SLIDE
#Serving an object
    @@@ ruby
    require 'drb'
    $SAFE = 1
    DRb.start_service(
      "druby://192.168.0.100:9000",
      my_object
    )

!SLIDE
#Client/proxy object
    @@@ ruby
    require 'drb'
    DRb.start_service()
    my_object = DRbObject.new(
      nil,
      'druby://192.168.0.100:9000'
    )
    my_object.any_method_you_want

!SLIDE
#Why you need $SAFE
    @@@ ruby
    #DO NOT RUN THIS CODE!!
    class << my_object
      undef :instance_eval
    end
    my_object.instance_eval("`rm *`")

!SLIDE
#JRuby $SAFEty
    @@@ ruby
    class <<self
        undef_method :instance_eval
        undef_method :instance_exec
        undef_method :instance_variable_defined?
        #...
    end

!SLIDE
    @@@ ruby
    require 'drb'
    class Sketch < Processing::App
        def setup
            render_mode P3D
            #Undef a bunch of methods
            DRb.start_service(URL, self)
        end
        def draw
        end
    end
    
    
!SLIDE
    @@@ ruby
    require 'drb'
    DRb.start_service()
    o = DRbObject.new(
      nil,
      'druby://192.168.0.100:9000'
    )
    o.background 0
    o.stroke 0, 255, 0
    o.fill 0, 0, 255
    o.translate 200, 200, 0
    o.rotate_x 3.14 / 5.0
    o.box 90
    o.translate 100, 100, 0
    o.sphere 50

!SLIDE
    @@@ruby
    require "ruboto.rb"
    require 'drb'
    DRb.start_service

    $activity.start_ruboto_activity "$druby" do
      @service = DRbObject.new(
        nil, "druby://192.168.0.100:9000"
      )
      handle_touch_event do |event|
        @service.fill 50, 255, 100
        @service.stroke 50, 255, 100
        @service.ellipse
          event.get_x, event.get_y, 16, 16
      end
    end
    