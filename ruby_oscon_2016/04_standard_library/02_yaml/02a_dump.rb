require "yaml"

# Create a class with attributes of your choosing.
# Example:
class LoveInterest
  attr_accessor :name, :hobby
end

# Create an instance of your class and assign
# values to your attributes. Example:
my_ex = LoveInterest.new
my_ex.hobby = "drinking"
my_ex.name = "REDACTED"

# Finally, pass your instance to the YAML.dump
# method, and print the result with "puts".

# YOUR CODE HERE
