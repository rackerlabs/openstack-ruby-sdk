class OpenStackRubySDK::Neutron::Subnet
  include Core::Model
  attr_accessor :allocation_pools, :cidr, :created_at, :dns_nameservers, :enable_dhcp, :gateway_ip, :host_routes, :id, :ip_version, :name, :network_id, :tenant_id, :updated_at, :ipv6_ra_mode, :ipv6_address_mode, :subnetpool_id

  rackspace_api_path "/v2.0/subnets"

  def save
    data = Core::Helpers.payload_builder(:subnet, { name: name })
    refresh! Core::Request.put(url, data)
  end
end
