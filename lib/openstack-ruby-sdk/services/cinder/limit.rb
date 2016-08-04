class OpenStackRubySDK::Cinder::Limit
  include Peace::Model

  def self.all
    Peace::Request.get(self.collection_url)
  end
end
