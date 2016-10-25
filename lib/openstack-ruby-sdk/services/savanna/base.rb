class OpenStackRubySDK::Savanna 
  include Core::Service

  has_resource :cluster
  has_resource :credential
  has_resource :distro
  has_resource :flavor
  has_resource :node
  has_resource :script
  has_resource :stack

  def initialize
  end

end
