class OpenStackRubySDK::Designate::Domain 
  include Core::Model
	attr_accessor :account_id, :comment, :created, :email_address, :id, :name, :nameservers, :records_list, :ttl, :updated
	
	belongs_to :account

	class << self
		def domains_by_name; end
	end

	def destroy; end
	def search; end
	def details; end
	def changes; end
	def export; end
	def clone; end
	def import; end
end
