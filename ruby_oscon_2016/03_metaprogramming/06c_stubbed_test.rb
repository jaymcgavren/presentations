require_relative '06a_spider'
require 'minitest/autorun'

class FakeResponse
  attr_accessor :body
end

class TestSpider < MiniTest::Test
  def test_get_body
    spider = Spider.new
    spider.address = 'conferences.oreilly.com'
    spider.path = '/oscon/'

    def spider.get_response
      response = FakeResponse.new
      response.body = '<h1>Welcome to Austin!</h1>'
      response
    end

    assert spider.get_body.include?('Austin')
  end
end
