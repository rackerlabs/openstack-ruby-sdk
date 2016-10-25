class OpenStackRubySDK::Trove::Flavor 
  include Core::Model
  attr_accessor :id, :name, :ram, :links

  def flavors_for_datastore_version; end
end
