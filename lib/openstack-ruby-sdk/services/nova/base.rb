class OpenStackRubySDK::Nova
  include Peace::Service

  has_resource :action
  has_resource :attachment
  has_resource :flavor
  has_resource :image
  has_resource :key_pair
  has_resource :metadatum
  has_resource :metadatum_item
  has_resource :misc
  has_resource :network
  has_resource :server
  has_resource :virtual_interface
  has_resource :volume

  def initialize
  end

end
