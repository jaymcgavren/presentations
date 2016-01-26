require 'erb'

erb_string = File.read('bottles.erb')
erb = ERB.new(erb_string)
99.downto(1) do |number|
  puts erb.result(binding)
end
