require 'erb'

name = "Jay"
languages = ["Ruby", "Go"]

# Create an ERB template that uses the variables above
# to print a welcome message like this:

# Welcome to OSCON, Jay!
# You are enrolled in tutorials for these languages:
#   Ruby
#   Go

erb_string = <<END
Your string goes here.
Use <%= name %> to embed the name variable.
To loop through the languages, use:
<% languages.each do |language| %>
<% end %>
Within that loop, use <%= language %> to
embed the current language from the array.
END

erb = ERB.new(erb_string)
puts erb.result(binding)
