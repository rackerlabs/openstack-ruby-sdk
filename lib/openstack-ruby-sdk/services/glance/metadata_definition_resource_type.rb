class OpenStackRubySDK::Glance::MetadataDefinitionResourceType  
  include Peace::Model
  attr_accessor :created_at, :name, :updated_at
  # GET /v2/metadefs/resource_types
  # POST /v2/metadefs/namespaces/​{namespace_id}​/resource_types
  # GET /v2/metadefs/namespaces/​{namespace_id}​/resource_types
  # DELETE /v2/metadefs/namespaces/​{namespace_id}​/resource_types/​{name}​
end
