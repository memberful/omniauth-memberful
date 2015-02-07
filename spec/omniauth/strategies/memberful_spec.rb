require 'spec_helper'

describe OmniAuth::Strategies::Memberful do
  let(:request) { double('Request', params: {}, cookies: {}, env: {}) }

  subject do
    args = ['appid', 'secret', @options].compact
    OmniAuth::Strategies::Memberful.new(*args).tap do |strategy|
      allow(strategy).to receive(:request) {
        request
      }
    end
  end

  describe 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq('memberful')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('/oauth')
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('/oauth/token')
    end

    context 'site' do
      it 'is inserts example by default' do
        expect(subject.options.client_options.site).to eq 'https://yoursite.memberful.com'
      end

      it 'accepts option' do
        @options = { client_options: { site: 'https://mysite.memberful.com' } }
        expect(subject.options.client_options.site).to eq 'https://mysite.memberful.com'
      end
    end
  end
end
