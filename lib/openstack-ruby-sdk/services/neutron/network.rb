class OpenStackRubySDK::Neutron::Network  
  include Peace::Model
  attr_accessor :admin_state_up, :created_at, :id, :mtu, :name, :port_security_enabled, :qos_policy_id, :router, :shared, :status, :subnets, :tenant_id, :updated_at
  # GET /v2.0/networks
  # POST /v2.0/networks
  # POST /v2.0/networks
  # GET /v2.0/networks/​{network_id}​
  # PUT /v2.0/networks/​{network_id}​
  # DELETE /v2.0/networks/​{network_id}​
end
