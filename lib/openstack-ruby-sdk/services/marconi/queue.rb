class OpenStackRubySDK::Marconi::Queue 
  include Core::Model
	attr_accessor :href, :name
	
	def check_existence; end
	def set_metadata; end
	def metadata; end
	def stats; end
end
