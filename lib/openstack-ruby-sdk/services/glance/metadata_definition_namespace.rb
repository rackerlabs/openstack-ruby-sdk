class OpenStackRubySDK::Glance::MetadataDefinitionNamespace  
  include Peace::Model
  attr_accessor :created_at, :description, :display_name, :namespace, :owner, :properties, :protected, :resource_type_associations, :schema, :self, :updated_at, :visibility
  # POST /v2/metadefs/namespaces
  # GET /v2/metadefs/namespaces
  # GET /v2/metadefs/namespaces/​{namespace_id}​
  # PUT /v2/metadefs/namespaces/​{namespace_id}​
  # DELETE /v2/metadefs/namespaces/​{namespace_id}​
end
