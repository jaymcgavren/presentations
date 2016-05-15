require 'erb'

name = "Jay"
languages = ["Ruby", "Go"]

erb_string = <<END
Welcome to OSCON, <%= name %>!
You are enrolled in tutorials for these languages:
<% languages.each do |language| %>
  <%= language %>
<% end %>
END

erb = ERB.new(erb_string)
puts erb.result(binding)
