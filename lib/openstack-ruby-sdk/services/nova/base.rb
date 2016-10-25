class OpenStackRubySDK::Nova
  include Core::Service

  has_resource :action
  has_resource :flavor
  has_resource :image
  has_resource :key_pair
  has_resource :misc
  has_resource :network
  has_resource :server
  has_resource :volume_attachment

  def initialize
  end

end
