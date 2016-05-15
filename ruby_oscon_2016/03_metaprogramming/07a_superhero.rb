class Person
  def speak
    puts "Hello!"
  end
end

hero = Person.new
hero.speak

# Define a singleton method on "hero" so that the below
# method call will work. (If flying's not your thing,
# give them other superpowers of your choosing.)

hero.fly
