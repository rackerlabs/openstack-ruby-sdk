class OpenStackRubySDK::Cinder
  include Peace::Service

  has_resource :backend_storage_pool
  has_resource :backup
  has_resource :consistency_group
  has_resource :limit
  has_resource :quality_of_service
  has_resource :quota_sets_extension
  has_resource :volume_image_metadata_extension
  has_resource :volume_manage_extension
  has_resource :volume_snapshot
  has_resource :volume_transfer
  has_resource :volume

end
