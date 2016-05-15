class Politician
  # Define method_missing so that the below method calls
  # work. The name of the called method is passed as
  # the first parameter to method_missing, and the first
  # argument of the method call becomes the second
  # parameter to method_missing.
end

politician = Politician.new
politician.lower("taxes")
# Output: I promise to lower taxes!
politician.improve("education")
# Output: I promise to improve education!
