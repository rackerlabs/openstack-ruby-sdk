module Core; end

path = File.dirname(File.absolute_path(__FILE__))
Dir.glob("#{path}/modules/*.rb"){ |f| require f }
Dir.glob("#{path}/*.rb"){ |f| require f }

module Core

  @@auth_token      = nil
  @@service_catalog = nil
  @@tenant_id       = nil
  @@logger          = nil

  class << self
    def auth_token
      @@auth_token
    end

    def tenant_id
      @@tenant_id
    end

    def service_catalog
      @@service_catalog ||= Core::ServiceCatalog.load!
    end

    def auth_token=(token)
      @@auth_token = token
    end

    def tenant_id=(id)
      @@tenant_id = id
    end

    def logger
      @@logger ||= Core::Logger.logger
    end
  end
end
