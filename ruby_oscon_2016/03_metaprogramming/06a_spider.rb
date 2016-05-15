require 'net/http'

class Spider
  attr_accessor :address, :path
  def get_response
    response = Net::HTTP.get_response(@address, @path)
  end
  def get_body
    get_response.body
  end
end
