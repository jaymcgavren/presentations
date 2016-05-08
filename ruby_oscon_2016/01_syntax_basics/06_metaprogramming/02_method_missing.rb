class AskMeAnything
  def method_missing(method_name)
    "You called #{method_name.to_s}"
  end
end

object = AskMeAnything.new
puts object.this_method_is_not_defined
puts object.also_undefined
