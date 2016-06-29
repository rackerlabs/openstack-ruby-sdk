class OpenStackRubySDK::Neutron
  include Peace::Service
  has_resource :network
  has_resource :port
  has_resource :security_group
  has_resource :security_group_rule
  has_resource :subnet

  def initialize
  end
end
