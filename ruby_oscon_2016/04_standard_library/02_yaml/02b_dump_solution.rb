require "yaml"

class LoveInterest
  attr_accessor :name, :hobby
end

my_ex = LoveInterest.new
my_ex.hobby = "drinking"
my_ex.name = "REDACTED"

puts YAML.dump(my_ex)
