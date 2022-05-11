
require_relative 'scanner'

module Printer
  def write(content)
    puts "Printer >>"
    puts content
    puts "Printer >> #{Time.now}"
  end
end

class Analysis < Scanner
  include Printer

  def initialize(url)
    super url
  end

  def print
    write info
  end
end

url = ARGV[0]

data = Analysis.new url
data.print

