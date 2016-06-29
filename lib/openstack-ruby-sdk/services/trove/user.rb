class OpenStackRubySDK::Trove::User 
  include Peace::Model
  attr_accessor :id, :password, :databases, :host

  def grant_user_access; end
  def revoke_user_access; end
	def users_in_database_instance; end
	def change_user_password; end
	def modify_user_attributes; end
	def user_access; end
end
