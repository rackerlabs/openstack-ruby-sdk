class OpenStackRubySDK::Nova::KeyPair
  include Peace::Model

  attr_accessor :id, :public_key, :private_key, :user_id, :fingerprint, :name

  belongs_to :user
  rackspace_api_path "os-keypairs"

  class << self
    def collection_name
      'keypairs'
    end

    def find(name)
      all.find{ |o| o.name == name }
    end
  end

  def resource_name
    'keypair'
  end

  def destroy
    Peace::Request.delete("#{url}/#{name}")
  end

  def save
    data = Peace::Helpers.payload_builder(:keypair, {
      name: name,
      public_key: public_key,
      fingerprint: fingerprint
    })

    refresh! Peace::Request.post(url, data)
  end

end
