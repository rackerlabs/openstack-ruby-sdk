class OpenStackRubySDK::Poppy::Service 
  include Core::Model
  attr_accessor :id, :name, :domains, :origins, :caching, :restrictions, :flavor_id, :status, :links
  
  belongs_to :flavor

  def purge_cached_assets; end

end
