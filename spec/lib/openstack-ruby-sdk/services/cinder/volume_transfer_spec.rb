require 'spec_helper'

describe OpenStackRubySDK::Cinder::VolumeTransfer do
  let!(:volume) { fresh_volume }
  let(:transfer) do
    OpenStackRubySDK::Cinder::VolumeTransfer.create({
      name: "testing",
      volume_id: volume.id
    })
  end

  it 'is creatable' do
    expect(transfer.auth_key).to be_present
  end

  it 'is acceptable' do
    expect(transfer.accept!(transfer.auth_key)).to eq(transfer)
  end

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::VolumeTransfer.all.count).to be >= 0
  end

  it 'deletes its self' do
    expect(transfer.destroy).to eq(true)
  end
end
