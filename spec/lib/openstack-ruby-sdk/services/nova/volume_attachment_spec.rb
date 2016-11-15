require 'spec_helper'

describe OpenStackRubySDK::Nova::VolumeAttachment do
  let(:volume_id){ 'f2176250-b0d9-4e3f-948c-df959dfba6fc' }
  let(:flavor_id) { '1' }
  let(:image_id) { '9060f38f-bb54-4806-a2b3-24a2173af252' }
  let(:server) do
    s = OpenStackRubySDK::Nova::Server.create({
      flavorRef: flavor_id,
      imageRef: image_id,
      name: Time.now.usec.to_s
    })

    Core::Helpers.wait_for(s)
  end

  after do
    OpenStackRubySDK::Nova::Server.all.each{ |s| s.destroy }
  end

end
