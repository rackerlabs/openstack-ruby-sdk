class OpenStackRubySDK::Designate::Zone 
  include Core::Model
  attr_accessor :id, :email, :domain, :created, :updated, :account_id, :ttl, :nameservers, :comment
  
  belongs_to :account

  attr_with_alias :email, :emailAddress
  attr_with_alias :account_id, :accountId

  def callback; end
  def modify_domain; end
  def remove_domain; end
end
