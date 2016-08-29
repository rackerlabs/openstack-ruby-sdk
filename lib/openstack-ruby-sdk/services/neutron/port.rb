class OpenStackRubySDK::Neutron::Port
  include Peace::Model

  attr_accessor :admin_state_up, :allowed_address_pairs, :created_at, :device_id, :device_owner, :extra_dhcp_opts, :fixed_ips, :id, :mac_address, :name, :network_id, :security_groups, :status, :tenant_id, :updated_at, :dns_assignment, :dns_name, :port_security_enabled, :subnet_id

  attr_with_alias :binding_host_id, "binding:host_id"
  attr_with_alias :binding_profile, "binding:profile"
  attr_with_alias :binding_vif_details, "binding:vif_details"
  attr_with_alias :binding_vif_type, "binding:vif_type"
  attr_with_alias :binding_vnic_type, "binding:vnic_type"

  rackspace_api_path "/v2.0/ports"

  def save
    data = Peace::Helpers.payload_builder(:port, {
      admin_state_up: admin_state_up,
      allowed_address_pairs: allowed_address_pairs,
      device_id: device_id,
      device_owner: device_owner,
      fixed_ips: fixed_ips,
      mac_address: mac_address,
      name: name,
      opt_name: dns_name,
      opt_value: extra_dhcp_opts,
      security_groups: security_groups,
      subnet_id: subnet_id
    })
    refresh! Peace::Request.put(url, data)
  end
end
