module Core
  class BadRequest < StandardError
    def initialize(msg)
      msg        = msg.gsub("u'", "'")
      match      = msg.match(/not allowed \((.*)' were unexpected\)/)
      additional = match[1].split("', '").sort.join(', ')

      super "These fields were unexpected: #{additional}"
    rescue
      super msg
    end
  end
end
