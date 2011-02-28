items = ['each', 'will', 
  'be', 'a', 'point']

template = <<-EOD
  <ul>
    <% items.each do |item| %>
      <li><%= item %></li>
    <% end %>
  </ul>
EOD

require 'erb'

erb = ERB.new(template)
erb.run(binding)