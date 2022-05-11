
require_relative 'delete'
require_relative 'get'
require_relative 'patch'
require_relative 'post'

class Handler
  def initialize(response)
    @response = response
  end

  include GetHandler
  include PostHandler
  include PatchHandler
  include DeleteHandler
end
