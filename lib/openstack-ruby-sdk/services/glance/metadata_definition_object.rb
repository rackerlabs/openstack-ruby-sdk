class OpenStackRubySDK::Glance::MetadataDefinitionObject  
  include Peace::Model
  attr_accessor :created_at, :description, :name, :properties, :required, :schema, :self
  # POST /v2/metadefs/namespaces/​{namespace_id}​/objects
  # GET /v2/metadefs/namespaces/​{namespace_id}​/objects
  # GET /v2/metadefs/namespaces/​{namespace_id}​/objects/​{object_name}​
  # PUT /v2/metadefs/namespaces/​{namespace_id}​/objects/​{object_name}​
  # DELETE /v2/metadefs/namespaces/​{namespace_id}​/objects/​{object_name}​
end
