require 'spec_helper'

describe OpenStackRubySDK::Nova::VolumeAttachment, :vcr do
  let(:attachment){ OpenStackRubySDK::Nova::VolumeAttachment.new }
  let(:flavor_id) { '1' }
  let(:image_id) { '9060f38f-bb54-4806-a2b3-24a2173af252' }
  let(:server) do
    s = OpenStackRubySDK::Nova::Server.create({
      flavorRef: flavor_id,
      imageRef: image_id,
      name: Time.now.usec.to_s
    })

    Peace::Helpers.wait_for(s)
  end

  after do
    OpenStackRubySDK::Nova::Server.all.each{ |s| s.destroy }
  end


end
