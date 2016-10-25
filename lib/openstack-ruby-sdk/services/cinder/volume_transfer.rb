class OpenStackRubySDK::Cinder::VolumeTransfer
  include Core::Model
  attr_accessor :created_at, :id, :links, :name, :volume_id, :auth_key

  json_key_name "transfer"
  api_path "os-volume-transfer"

  def self.create(opts={})
    data = Core::Helpers.payload_builder("transfer", {
      name: opts.fetch(:name),
      volume_id: opts.fetch(:volume_id)
    })
    response = Core::Request.post(collection_url, data)
    self.new(response)
  end

  def accept!(auth_key)
    data = { "accept": { "auth_key": "#{auth_key}" } }
    url  = "#{self.url}/accept"
    refresh! Core::Request.post(url, data)
  end
end
