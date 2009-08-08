require 'erb'

items = ['each', 'will', 
  'be', 'a', 'point']

template = <<-EOD
  <ul>
    <% items.each do |item| %>
      <li><%= item %></li>
    <% end %>
  </ul>
EOD

ERB.new(template).run(binding)