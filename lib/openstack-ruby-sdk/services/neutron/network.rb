class OpenStackRubySDK::Neutron::Network
  include Peace::Model

  attr_accessor :admin_state_up, :created_at, :id, :mtu, :name, :port_security_enabled, :qos_policy_id, :router, :shared, :status, :subnets, :tenant_id, :updated_at

  attr_with_alias :provider_network, "provider:physical_network"
  attr_with_alias :external_router, "router:external"
  attr_with_alias :provider_network_type, "provider:network_type"
  attr_with_alias :provider_segmentation_id, "provider:segmentation_id"

  belongs_to :tenant
  has_many :ports
  # has_many :subnets

  rackspace_api_path "/v2.0/networks"

  def save
    data = Peace::Helpers.payload_builder(:network, {
      'router:external': external_router,
      admin_state_up: admin_state_up,
      name: name,
      port_security_enabled: port_security_enabled
    })

    refresh! Peace::Request.put(url, data)
  end
end
