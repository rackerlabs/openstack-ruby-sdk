class OpenStackRubySDK::Heat::StackResource < Peace::Model
  attr_accessor :attributes, :creation_time, :description, :links, :logical_resource_id, :physical_resource_id, :required_by, :resource_name, :resource_status, :resource_status_reason, :resource_type, :updated_time
  # GET /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/resources
  # GET /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/resources/​{resource_name}​
  # GET /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/resources/​{resource_name}​/metadata
  # POST /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/resources/​{resource_name}​/signal
end
