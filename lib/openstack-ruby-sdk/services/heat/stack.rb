class OpenStackRubySDK::Heat::Stack  
  include Peace::Model
  attr_accessor :capabilities, :creation_time, :description, :disable_rollback, :id, :links, :notification_topics, :outputs, :parameters, :parent, :stack_name, :stack_owner, :stack_status, :stack_status_reason, :stack_user_project_id, :tags, :template_description, :timeout_mins, :updated_time
  # POST /v1/​{tenant_id}​/stacks
  # POST /v1/​{tenant_id}​/stacks
  # GET /v1/​{tenant_id}​/stacks
  # POST /v1/​{tenant_id}​/stacks/preview
  # PUT /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/preview
  # GET /v1/​{tenant_id}​/stacks/​{stack_name}​
  # GET /v1/​{tenant_id}​/stacks/​{stack_name}​/resources
  # GET /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​
  # PUT /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​
  # DELETE /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​
  # DELETE /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/abandon
  # POST /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/snapshots
  # GET /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/snapshots
  # GET /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/snapshots/​{snapshot_id}​
  # DELETE /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/snapshots/​{snapshot_id}​
  # POST /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/snapshots/​{snapshot_id}​/restore
  # GET /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/outputs
  # GET /v1/​{tenant_id}​/stacks/​{stack_name}​/​{stack_id}​/outputs/​{output_key}​
end
