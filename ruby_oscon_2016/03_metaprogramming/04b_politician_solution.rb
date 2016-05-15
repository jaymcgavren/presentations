class Politician
  def method_missing(method_name, argument)
    puts "I promise to #{method_name} #{argument}!"
  end
end

politician = Politician.new
politician.lower("taxes")
politician.improve("education")
politician.fix("health care")
