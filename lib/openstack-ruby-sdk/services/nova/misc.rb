class OpenStackRubySDK::Nova::Misc
  include Core::Model

  class << self

    def limits
      Core::Request.get(url('/limits'))
    end

    def quotas
      Core::Request.get(url("/os-quota-sets/#{Core.tenant_id}"))
    end

    def extensions
      Core::Request.get(url("/extensions"))
    end

    private

    def url(path)
      # Even though we don't have a 'model', we can leverage Core::Model to get the collection_url that we can modify
      self.collection_url.gsub('/miscs', path)
    end
  end

end
