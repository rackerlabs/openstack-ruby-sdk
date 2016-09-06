require 'spec_helper'

describe OpenStackRubySDK::Glance::MetadataDefinitionProperty do
  let(:klass){ OpenStackRubySDK::Glance::MetadataDefinitionProperty }
  let(:obj){ klass.new }

  describe "Validation" do
    it 'requires these attributes'
  end

  describe "Endpoints" do
    it 'knows the :index endpoint' do
			expect(klass.endpoints.index.url).to eq("")
			expect(klass.endpoints.index.method).to eq(:get)
		end

    it 'knows the :show endpoint' do
			expect(obj.endpoints.show.url).to eq("")
			expect(obj.endpoints.show.method).to eq(:get)
		end

    it 'knows the :create endpoint' do
			expect(klass.endpoints.create.url).to eq("")
			expect(klass.endpoints.create.method).to eq(:post)
		end

    it 'knows the :update endpoint' do
			expect(obj.endpoints.update.url).to eq("")
			expect(obj.endpoints.update.method).to eq(:put)
		end

    it 'knows the :destroy endpoint' do
			expect(obj.endpoints.destroy.url).to eq("")
			expect(obj.endpoints.destroy.method).to eq(:delete)
		end
	end
end
