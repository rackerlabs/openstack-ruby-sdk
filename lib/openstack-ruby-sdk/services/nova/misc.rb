class OpenStackRubySDK::Nova::Misc
  include Peace::Model

  class << self

    def limits
      Peace::Request.get(url('/limits'))
    end

    def quotas
      Peace::Request.get(url("/os-quota-sets/#{Peace.tenant_id}"))
    end

    def extensions
      Peace::Request.get(url("/extensions"))
    end

    private

    def url(path)
      # Even though we don't have a 'model', we can leverage Peace::Model to get the collection_url that we can modify
      self.collection_url.gsub('/miscs', path)
    end
  end

end
