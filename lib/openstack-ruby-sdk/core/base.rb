module Core; end

project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + '/rackspace-ruby-sdk-core/modules/*.rb'){ |f| require f }
Dir.glob(project_root + '/rackspace-ruby-sdk-core/*.rb'){ |f| require f }

module Core

  @@auth_token      = nil
  @@service_catalog = nil
  @@tenant_id       = nil
  @@sdk             = nil
  @@logger          = nil

  class << self
    def sdk
      @@sdk
    end

    def auth_token
      @@auth_token
    end

    def tenant_id
      @@tenant_id
    end

    def service_catalog
      host = ENV['SDK'].to_s

      if host == "" || host.nil? || !%w{openstack rackspace}.include?(host)
        raise "ENV['SDK'] must be either 'openstack' or 'rackspace'"
      end

      @@service_catalog ||= Core::ServiceCatalog.load!(host)
    end

    def sdk=(sdk)
      @@sdk = sdk
    end

    def auth_token=(token)
      @@auth_token = token
    end

    def tenant_id=(id)
      @@tenant_id = id
    end

    def service_catalog=(catalog)
      @@service_catalog = catalog
    end

    def logger
      @@logger ||= Core::Logger.logger
    end
  end
end
