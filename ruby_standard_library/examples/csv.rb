require 'csv'

data = <<-EOD
"Thomas, Dave",Programming Ruby,29.95
"Godin, Seth",The Dip,19.99
etc,etc,etc
EOD

data.split("\n").each do |line| 
  puts CSV.parse(line).inspect
end
