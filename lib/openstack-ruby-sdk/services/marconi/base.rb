class OpenStackRubySDK::Marconi 
  include Peace::Service

  has_resource :claim
  has_resource :message
  has_resource :queue

  def initialize
  end

  def home_document; end

end
