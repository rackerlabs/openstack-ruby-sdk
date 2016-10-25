class OpenStackRubySDK::Glance::MetadataDefinitionProperty  
  include Core::Model
  attr_accessor :hw_disk_bus, :hw_machine_type, :hw_qemu_guest_agent, :hw_rng_model, :hw_scsi_model, :hw_video_model, :hw_video_ram, :hw_vif_model, :os_command_line
  # POST /v2/metadefs/namespaces/​{namespace_id}​/properties
  # GET /v2/metadefs/namespaces/​{namespace_id}​/properties
  # GET /v2/metadefs/namespaces/​{namespace_id}​/properties/​{property_name}​
  # PUT /v2/metadefs/namespaces/​{namespace_id}​/properties/​{property_name}​
  # DELETE /v2/metadefs/namespaces/​{namespace_id}​/properties/​{property_name}​
end
