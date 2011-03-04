require 'logger'
require 'open-uri'
file_size = 100000; file_count = 10
logger = Logger.new('spider.log', file_count, file_size)
begin
  open('http://www.yahoo.com') {|f| logger.info f.status}
rescue Exception => e
  logger.warn e
end
