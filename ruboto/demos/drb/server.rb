URL = ENV['DRB_URL'] || 'druby://192.168.0.100:9000'

class Sketch < Processing::App
    def setup
        require 'drb'
        class <<self
            %w{
                clone
                define_singleton_method
                display
                dup
                extend
                freeze
                instance_eval
                instance_exec
                instance_variable_defined?
                instance_variable_get
                instance_variable_set
                instance_variables
                public_send
                remove_instance_variable
                send
                tap
                library_loaded?
                load_java_library
                load_libraries
                load_library
                load_ruby_library
            }.each do |method|
                if method_defined?(method.to_sym)
                    undef_method(method.to_sym)
                end
            end
        end
        image(load_image("sample.jpg"), 0, 0)
        DRb.start_service(URL, self)
    end
    def draw
    end
end
Sketch.new(:width => 1024, :height => 768, :title => URL, :full_screen => false)
