require 'spec_helper'

describe Fitgem do
  before do
    @client = Fitgem::Client.new({
      :client_id => '12345',
      :client_secret => '67890'
    })
  end

  describe 'global settings' do
    it 'should expose the api_version' do
      expect(@client.api_version).to eq "1"
    end

    it 'should all clients to set a new api version' do
      @client.api_version = "2"
      expect(@client.api_version).to eq "2"
    end

    it 'should default to the US unit system' do
      expect(@client.api_unit_system).to eq Fitgem::ApiUnitSystem.US
    end

    it 'should allow the unit system to be set to other types' do
      @client.api_unit_system = Fitgem::ApiUnitSystem.UK
      expect(@client.api_unit_system).to eq Fitgem::ApiUnitSystem.UK
      @client.api_unit_system = Fitgem::ApiUnitSystem.METRIC
      expect(@client.api_unit_system).to eq Fitgem::ApiUnitSystem.METRIC
    end

    it 'should default to a user id of \'-\', the currently-logged in user' do
      expect(@client.user_id).to eq '-'
    end

    it 'should default to the US locale' do
      expect(@client.api_locale).to eq Fitgem::ApiLocale.US
    end

    it 'should allow the locale to be set to other types' do
      @client.api_locale = Fitgem::ApiLocale.AU
      expect(@client.api_locale).to eq Fitgem::ApiLocale.AU
      @client.api_locale = Fitgem::ApiLocale.FR
      expect(@client.api_locale).to eq Fitgem::ApiLocale.FR
      @client.api_locale = Fitgem::ApiLocale.DE
      expect(@client.api_locale).to eq Fitgem::ApiLocale.DE
      @client.api_locale = Fitgem::ApiLocale.JP
      expect(@client.api_locale).to eq Fitgem::ApiLocale.JP
      @client.api_locale = Fitgem::ApiLocale.NZ
      expect(@client.api_locale).to eq Fitgem::ApiLocale.NZ
      @client.api_locale = Fitgem::ApiLocale.ES
      expect(@client.api_locale).to eq Fitgem::ApiLocale.ES
      @client.api_locale = Fitgem::ApiLocale.UK
      expect(@client.api_locale).to eq Fitgem::ApiLocale.UK
    end
  end

  describe '#reconnect' do
    it 'resets the access token' do
      access_token = @client.reconnect('abc', '123')
      expect(access_token.token).to eq('abc')
      #expect(access_token.secret).to eq('123')

      access_token = @client.reconnect('def', '456')
      expect(access_token.token).to eq('def')
      #expect(access_token.secret).to eq('456')
    end
  end
end
