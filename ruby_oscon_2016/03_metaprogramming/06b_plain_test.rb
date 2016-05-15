require_relative '06a_spider'
require 'minitest/autorun'

class TestSpider < MiniTest::Test
  def test_get_body
    spider = Spider.new
    spider.address = 'conferences.oreilly.com'
    spider.path = '/oscon/'
    assert spider.get_body.include?('Austin')
  end
end
