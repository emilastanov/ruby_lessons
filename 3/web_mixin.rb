
require "http"

module Web

  def get_content(url)
    HTTP.get(url)
  end

end
