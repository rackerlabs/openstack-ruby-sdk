class OpenStackRubySDK::Neutron::Port  
  include Peace::Model
  attr_accessor :admin_state_up, :allowed_address_pairs, :created_at, :device_id, :device_owner, :extra_dhcp_opts, :fixed_ips, :id, :mac_address, :name, :network_id, :security_groups, :status, :tenant_id, :updated_at
  # GET /v2.0/ports
  # POST /v2.0/ports
  # POST /v2.0/ports
  # GET /v2.0/ports/​{port_id}​
  # PUT /v2.0/ports/​{port_id}​
  # DELETE /v2.0/ports/​{port_id}​
end
