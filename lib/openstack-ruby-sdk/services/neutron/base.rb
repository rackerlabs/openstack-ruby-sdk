class OpenStackRubySDK::Neutron
  include Core::Service

  has_resource :load_balancer
  has_resource :network
  has_resource :port
  has_resource :security_group
  has_resource :security_group_rule
  has_resource :subnet
  
end
