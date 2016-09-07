require 'spec_helper'

describe OpenStackRubySDK::Swift::File do
  let(:klass){ OpenStackRubySDK::Swift::File }
  let(:obj){ klass.new }

  describe "Validation" do
    it 'requires these attributes'
  end

  describe "Endpoints" do
    it 'knows the :index endpoint' do
			expect(klass.endpoints.index.url).to eq("http://PUBLIC_IP:8080/v1/AUTH_TENANT_ID/files")
			expect(klass.endpoints.index.method).to eq(:get)
		end

    it 'knows the :show endpoint' do
			expect(obj.endpoints.show.url).to eq("http://PUBLIC_IP:8080/v1/AUTH_TENANT_ID/files/ID")
			expect(obj.endpoints.show.method).to eq(:get)
		end

    it 'knows the :create endpoint' do
			expect(klass.endpoints.create.url).to eq("http://PUBLIC_IP:8080/v1/AUTH_TENANT_ID/files")
			expect(klass.endpoints.create.method).to eq(:post)
		end

    it 'knows the :update endpoint' do
			expect(obj.endpoints.update.url).to eq("http://PUBLIC_IP:8080/v1/AUTH_TENANT_ID/files/ID")
			expect(obj.endpoints.update.method).to eq(:put)
		end

    it 'knows the :destroy endpoint' do
			expect(obj.endpoints.destroy.url).to eq("http://PUBLIC_IP:8080/v1/AUTH_TENANT_ID/files/ID")
			expect(obj.endpoints.destroy.method).to eq(:delete)
		end
	end
end
