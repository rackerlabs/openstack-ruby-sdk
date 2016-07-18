class OpenStackRubySDK::Cinder::ConsistencyGroupSnapshot  
  include Peace::Model
  attr_accessor :consistencygroup_id, :created_at, :description, :id, :name, :status
  # GET /v2/​{tenant_id}​/cgsnapshotsList consistency group snapshots
  # POST /v2/​{tenant_id}​/cgsnapshotsCreate consistency group snapshot
  # DELETE /v2/​{tenant_id}​/cgsnapshots/​{cgsnapshot_id}​
end
