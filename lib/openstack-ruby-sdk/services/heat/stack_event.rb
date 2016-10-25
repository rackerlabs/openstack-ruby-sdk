class OpenStackRubySDK::Heat::StackEvent  
  include Core::Model
  attr_accessor :event_time, :id, :links, :logical_resource_id, :physical_resource_id, :resource_name, :resource_status, :resource_status_reason
  # GET /v1/​{tenant_id}​/stacks/​{stack_name}​/events
  # GET /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/events
  # GET /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/resources/​{resource_name}​/events
  # GET /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/resources/​{resource_name}​/events/​{event_id}​
end
