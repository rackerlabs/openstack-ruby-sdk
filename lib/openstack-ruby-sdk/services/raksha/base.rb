class OpenStackRubySDK::Raksha 
  include Peace::Service

  has_resource :activity
  has_resource :agent
  has_resource :backup
  has_resource :backup_configuration
  has_resource :restore
  has_resource :restore_configuration
  has_resource :user

  def initialize
  end

end
