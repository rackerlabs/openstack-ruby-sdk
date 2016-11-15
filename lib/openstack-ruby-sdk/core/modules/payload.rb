ENV['SC_STUB'] = "true"

module Core::Payload
  def self.included(klass)
    klass.extend ClassMethods
  end

  def payload
    {}
  end

  private

  module ClassMethods
  end
end
