require 'net/http'
require 'yaml'

data = <<-EOD
--- !ruby/object:Net::HTTP 
address: jay.mcgavren.com
port: 80
started: false
use_ssl: false
EOD

puts YAML.load(data).get('/blog/')
