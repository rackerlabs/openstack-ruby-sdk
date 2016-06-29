class OpenStackRubySDK::Poppy 
  include Peace::Service

  has_resource :flavor
  has_resource :service
  has_resource :ssl_certificate

  def initialize
  end

  def the_home_document; end
  def ping_the_server; end

end
