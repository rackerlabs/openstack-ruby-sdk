class OpenStackRubySDK::Cinder::Limit
  include Core::Model

  def self.all
    Core::Request.get(self.collection_url)
  end
end
