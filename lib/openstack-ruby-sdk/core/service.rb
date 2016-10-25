module Core::Service

  def self.included(klass)
    klass.extend ClassMethods
    
    klass.class_eval do
      include Core::HasResources
    end
  end

  module ClassMethods
    def service_name
      service_name = self.to_s.demodulize.tableize.singularize
      service_name = "dns" if service_name == "dn"
      service_name.to_sym
    end
  end
end
