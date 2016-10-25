class OpenStackRubySDK::Trove 
  include Core::Service

  has_resource :configuration
  has_resource :configuration_parameter
  has_resource :datastore_type
  has_resource :flavor
  has_resource :high_availability
  has_resource :instance
  has_resource :on_demand_backup
  has_resource :replication
  has_resource :scheduled_backup
  has_resource :user

  def initialize
  end

end
