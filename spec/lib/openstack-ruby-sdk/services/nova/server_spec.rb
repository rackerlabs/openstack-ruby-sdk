require 'spec_helper'

describe OpenStackRubySDK::Nova::Server, :vcr do
  let(:flavorRef){ 1 }
  let(:imageRef){ "9060f38f-bb54-4806-a2b3-24a2173af252" }

  it 'can create instances' do
    s           = OpenStackRubySDK::Nova::Server.new
    s.name      = "Testing"
    s.flavorRef = flavorRef
    s.imageRef  = imageRef
    s.save
    s.reload
    expect(s.id).to be_present
  end

end
