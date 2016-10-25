class OpenStackRubySDK::Swift
  include Core::Service
  has_resource :account
  has_resource :container
  has_resource :file
  has_resource :object

  class << self
    def purge_cdn_enabled_containers; end
    def cdn_enabled_containers_served_through_ssl; end
    def streaming_cdn_enabled_containers; end
    def ios_streaming; end
    def cdn_log_delivery; end
  end

  def initialize
  end
end
