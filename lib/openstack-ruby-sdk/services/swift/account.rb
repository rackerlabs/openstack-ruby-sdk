class OpenStackRubySDK::Swift::Account
  include Core::Model
  attr_accessor :cdn_enabled, :cdn_ios_uri, :cdn_ssl_uri, :cdn_streaming_uri, :cdn_uri, :log_retention, :name, :ttl

  def details_and_containers; end
  def set_metadata; end
  def get_metadata; end
  def delete_metadata; end
  def containers; end
  
  # GET /v1/​{account}​
  # POST /v1/​{account}​
  # HEAD /v1/​{account}​
end
