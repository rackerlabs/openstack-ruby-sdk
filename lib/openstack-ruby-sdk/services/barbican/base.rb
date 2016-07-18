class OpenStackRubySDK::Barbican
  include Peace::Service

  has_resource :consumer
  has_resource :container
  has_resource :quota
  has_resource :secret

  def initialize
  end

end
