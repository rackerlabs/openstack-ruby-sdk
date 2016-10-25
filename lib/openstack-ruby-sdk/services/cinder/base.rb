class OpenStackRubySDK::Cinder
  include Core::Service

  has_resource :backup
  has_resource :consistency_group
  has_resource :limit
  has_resource :snapshot
  has_resource :volume
  has_resource :volume_transfer

end
