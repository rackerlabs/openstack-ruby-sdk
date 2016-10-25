class OpenStackRubySDK::Heat::Template  
  include Core::Model
  attr_accessor :HeatTemplateFormatVersion, :Outputs, :Parameters, :Resources
  # GET /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/template
  # GET /v1/​{tenant_id}​/template_versions
  # POST /v1/​{tenant_id}​/validate
  # GET /v1/​{tenant_id}​/resource_types/​{type_name}​/template
  # GET /v1/​{tenant_id}​/resource_types/​{type_name}​
  # GET /v1/​{tenant_id}​/resource_types
end
