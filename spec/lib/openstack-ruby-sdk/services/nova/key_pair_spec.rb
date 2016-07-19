require 'spec_helper'

describe OpenStackRubySDK::Nova::KeyPair, :vcr do
  let(:public_key) {
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDx8nkQv/zgGgB4rMYmIf+6A4l6Rr+o/6lHBQdW5aYd44bd8JttDCE/F/pNRr0lRE+PiqSPO8nDPHw0010JeMH9gYgnnFlyY3/OcJ02RhIPyyxYpv9FhY+2YiUkpwFOcLImyrxEsYXpD/0d3ac30bNH6Sw9JD9UZHYcpSxsIbECHw== Generated-by-Nova"
  }

  it 'gets an index' do
    expect(OpenStackRubySDK::Nova::KeyPair.all.count).to be >= 0
  end

  it 'is creatable' do
    k            = OpenStackRubySDK::Nova::KeyPair.new
    k.name       = Time.now.usec.to_s
    k.public_key = public_key
    k.save
    expect(k.user_id).to be_present
    expect(k.fingerprint).to be_present
  end

  it 'is getable' do
    name = OpenStackRubySDK::Nova::KeyPair.first.name
    expect(OpenStackRubySDK::Nova::KeyPair.find(name).name).to eq(name)
  end

  it 'is deletable' do
    k            = OpenStackRubySDK::Nova::KeyPair.new
    k.name       = Time.now.usec.to_s
    k.public_key = public_key
    k.save
    expect(k.destroy).to eq(true)
  end

end
