require 'spec_helper'

describe OpenStackRubySDK::Poppy::SslCertificate, :vcr do
  let(:ssl_certificate){ OpenStackRubySDK::Poppy::SslCertificate.new }

  it 'gets an index' do
    expect(OpenStackRubySDK::Poppy::SslCertificate.all).to eq([])
  end

  it 'gets its self' do
    expect(OpenStackRubySDK::Poppy::SslCertificate.find(ssl_certificate.id)).to eq(ssl_certificate)
  end

  it 'creates its self' do
    ssl_certificate.name = Time.now.usec.to_s
    expect(ssl_certificate.save).to eq(true)
  end

  it 'updates its self' do
    ssl_certificate.name = Time.now.usec.to_s
    expect(ssl_certificate.save).to eq(true)
    ssl_certificate.name = Time.now.usec.to_s
    expect(ssl_certificate.save).to eq(true)
  end

  it 'deletes its self' do
    expect(ssl_certificate.destroy).to eq(true)
  end
end
