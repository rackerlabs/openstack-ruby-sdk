require 'spec_helper'

describe OpenStackRubySDK::Cinder::Snapshot do
  let(:volume) { fresh_volume }
  let(:snapshot) { volume.take_snapshot!("name", "description") }

  it 'is creatable' do
    expect(snapshot.name).to eq("name")
  end

  it 'is deletable' do
    expect(snapshot.destroy).to eq(true)
  end

  it 'gets an index' do
    expect(OpenStackRubySDK::Cinder::Snapshot.all.count).to be >= 0
  end

  it 'updates its self' do
    title = "Something different"
    snapshot.name = title
    snapshot.save
    expect(snapshot.name).to eq(title)
  end

end
