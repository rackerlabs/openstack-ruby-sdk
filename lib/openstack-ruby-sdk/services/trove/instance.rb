class OpenStackRubySDK::Trove::Instance 
  include Peace::Model
  attr_accessor :id, :name, :created, :updated, :state, :hostname, :links, :flavor_id, :volume, :datastore

  attr_with_alias :state, :status
  attr_with_alias :flavor_id, :flavor

  def check_root_user; end
  def enable_root_user; end
  def restart; end
  def resize; end
  def resize_volume; end
end
