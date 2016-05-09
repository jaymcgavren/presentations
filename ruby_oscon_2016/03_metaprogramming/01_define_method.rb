class Class
  def my_attr_accessor(attribute)
    define_method attribute do
      puts "Getting value of #{attribute}"
      instance_variable_get("@#{attribute.to_s}")
    end
    define_method "#{attribute.to_s}=" do |new_value|
      puts "Setting value of #{attribute} to #{new_value}"
      instance_variable_set("@#{attribute.to_s}", new_value)
    end
  end
end

class Movie
  my_attr_accessor :title
end

movie = Movie.new
movie.title = "Jaws"
puts movie.title
