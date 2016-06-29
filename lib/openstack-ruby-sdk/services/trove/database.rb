class OpenStackRubySDK::Trove::Database 
  include Peace::Model
  attr_accessor :id, :character_set, :collate

  def restart; end
  def resize; end
  def resize_volume; end
  def status_and_details; end
  def change_name; end
  def default_configuration; end
  def enable_root_user; end
  def root_enabled_status; end
end
