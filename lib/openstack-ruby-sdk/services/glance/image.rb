class OpenStackRubySDK::Glance::Image  
  include Peace::Model
  attr_accessor :checksum, :container_format, :created_at, :disk_format, :file, :id, :min_disk, :min_ram, :name, :owner, :protected, :schema, :self, :size, :status, :tags, :updated_at, :virtual_size, :visibility
  # GET /v2/images
  # POST /v2/images
  # GET /v2/images/​{image_id}​
  # PATCH /v2/images/​{image_id}​
  # DELETE /v2/images/​{image_id}​
  # POST /v2/images/​{image_id}​/actions/reactivate
  # POST /v2/images/​{image_id}​/actions/deactivate
end
