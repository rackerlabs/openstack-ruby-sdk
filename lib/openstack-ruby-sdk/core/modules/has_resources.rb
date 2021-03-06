module Core::HasResources

  def self.included(klass)
    mattr_accessor :resources
    klass.extend ClassMethods
  end

  def available_resources
    self.class.available_resources
  end


  module ClassMethods
    def has_resource(klass_name)
      name = service_name.to_sym

      @@resources       ||= {}
      @@resources[name] ||= []
      @@resources[name] << klass_name
    end

    def new(*args, &block)
      stub_resources!
      super
    end

    def available_services
      @available_services ||= Core::ServiceCatalog.load!.available_services
    end

    def available_resources
      @@resources[service_name]
    end

    private

    def stub_resources!
      return unless defined? @@resources

      @@resources[service_name.to_sym].each do |name|
        define_method(name.to_s.pluralize, lambda {
          modpath = self.class.to_s.split('::')
          modpath << name.to_s.classify # Inject :name classname
          klass = modpath.join('::').constantize
          klass.all
        })
      end
    end
  end
end
