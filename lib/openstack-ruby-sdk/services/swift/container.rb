class OpenStackRubySDK::Swift::Container < Peace::Model
  attr_accessor :hash, :last_modified, :bytes, :name, :content_type
  # GET /v1/​{account}​/​{container}​
  # PUT /v1/​{account}​/​{container}​
  # DELETE /v1/​{account}​/​{container}​
  # POST /v1/​{account}​/​{container}​
  # HEAD /v1/​{account}​/​{container}​
end
