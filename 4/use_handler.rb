
require_relative 'handler'

handler = Handler.new({"body"=> "St data."})
puts handler.patch
puts handler.get
puts handler.delete
puts handler.post
