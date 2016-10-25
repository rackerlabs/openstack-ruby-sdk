class OpenStackRubySDK::Neutron::SecurityGroup 
  include Core::Model
  attr_accessor :id, :name, :description, :tenant_id
  belongs_to :tenant
  has_many :security_group_rules

	def rules; end
	def create_rule; end
	def delete_rule; end
end
