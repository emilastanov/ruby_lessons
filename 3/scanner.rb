
require_relative 'web_mixin'

class Scanner
  include Web

  attr_accessor :url

  def initialize(url)
    @url = url
    @request = get_content(@url)
  end

  def headers
    headers = {}
    @request.headers.each{|header| headers[header[0]] = header[1] }
    headers
  end

  def info
    "="*50 +
    "\nLocation".ljust(20) + "#{headers["Location"]}" +
    "\nServer".ljust(20) + "#{headers["Server"]}" +
    "\nServer date".ljust(20) + "#{headers["Date"]}\n" +
    "="*50
  end

end
