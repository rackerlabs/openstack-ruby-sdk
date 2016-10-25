class OpenStackRubySDK::Neutron::LoadBalancer
  include Core::Model

  attr_accessor :description, :admin_state_up, :tenant_id, :provisioning_status, :listeners, :vip_address, :vip_subnet_id, :id, :operating_status, :name, :provider, :vip_port_id

  attr_with_alias :state, :provisioning_status

  api_path "/v2.0/lbaas/loadbalancers"
  json_key_name :loadbalancer

  def self.create(opts={})
    data = Core::Helpers.payload_builder("loadbalancer", {
      admin_state_up: opts.fetch(:admin_state_up),
      description: opts.fetch(:description),
      name: opts.fetch(:name),
      vip_address: opts.fetch(:vip_address),
      vip_subnet_id: opts.fetch(:vip_subnet_id)
    })

    response = Core::Request.post(collection_url, data)
    lb = self.new(response)

    Core::Helpers.wait_for(lb, 'ACTIVE')
  end

  def save
    data = Core::Helpers.payload_builder("loadbalancer", {
      admin_state_up: admin_state_up,
      description: description,
      name: name,
      vip_address: vip_address,
      vip_subnet_id: vip_subnet_id
    })

    refresh! Core::Request.put(url, data)
    Core::Helpers.wait_for(lb, 'ACTIVE')
  end

end
