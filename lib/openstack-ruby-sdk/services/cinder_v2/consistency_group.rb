class OpenStackRubySDK::CinderV2::ConsistencyGroup < Peace::Model
  attr_accessor :availability_zone, :created_at, :description, :id, :name, :status, :volume_types
  # GET /v2/​{tenant_id}​/consistencygroups
  # POST /v2/​{tenant_id}​/consistencygroups
  # GET /v2/​{tenant_id}​/consistencygroups/detail
  # POST /v2/​{tenant_id}​/consistencygroups/create_from_src
  # GET /v2/​{tenant_id}​/consistencygroups/​{consistencygroup_id}​
  # POST /v2/​{tenant_id}​/consistencygroups/​{consistencygroup_id}​/delete
  # PUT /v2/​{tenant_id}​/consistencygroups/​{consistencygroup_id}​/update
end
