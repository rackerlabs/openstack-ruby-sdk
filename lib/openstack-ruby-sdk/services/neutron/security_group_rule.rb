class OpenStackRubySDK::Neutron::SecurityGroupRule
  include Peace::Model
  attr_accessor :id, :direction, :ethertype, :port_range_max, :port_range_min, :protocol, :remote_group_id, :remote_ip_prefix, :security_group_id, :tenant_id

  belongs_to :remote_group
  belongs_to :security_group
  belongs_to :tenant
end
