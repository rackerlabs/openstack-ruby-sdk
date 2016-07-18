class OpenStackRubySDK::Glance::Member  
  include Peace::Model
  attr_accessor :created_at, :image_id, :member_id, :schema, :status, :updated_at
  # GET /v2/images/​{image_id}​/members
  # POST /v2/images/​{image_id}​/members
  # GET /v2/images/​{image_id}​/members/​{member_id}​
  # PUT /v2/images/​{image_id}​/members/​{member_id}​
  # DELETE /v2/images/​{image_id}​/members/​{member_id}​
end
