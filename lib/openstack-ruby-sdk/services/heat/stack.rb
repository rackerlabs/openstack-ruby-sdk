class OpenStackRubySDK::Heat::Stack < Peace::Model
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
