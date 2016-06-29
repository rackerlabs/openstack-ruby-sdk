class OpenStackRubySDK::Swift::Container
  include Peace::Model
  attr_accessor :hash, :last_modified, :bytes, :name, :content_type

  class << self
    def container_access_control_lists; end
    def container_quotas; end
    def access_log_delivery; end
  end

  def delete_metadata; end
  def details; end
  def metadata; end
  def set_metadata; end
  def toggle_cdn; end
  
  # GET /v1/​{account}​/​{container}​
  # PUT /v1/​{account}​/​{container}​
  # DELETE /v1/​{account}​/​{container}​
  # POST /v1/​{account}​/​{container}​
  # HEAD /v1/​{account}​/​{container}​
end
