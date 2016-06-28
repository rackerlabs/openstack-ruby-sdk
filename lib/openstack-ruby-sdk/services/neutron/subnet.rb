class OpenStackRubySDK::Neutron::Subnet  
  include Peace::Model
  attr_accessor :allocation_pools, :cidr, :created_at, :dns_nameservers, :enable_dhcp, :gateway_ip, :host_routes, :id, :ip_version, :name, :network_id, :tenant_id, :updated_at
  # GET /v2.0/subnets
  # POST /v2.0/subnets
  # POST /v2.0/subnets
  # GET /v2.0/subnets/​{subnet_id}​
  # PUT /v2.0/subnets/​{subnet_id}​
  # DELETE /v2.0/subnets/​{subnet_id}​
end
