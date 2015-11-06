require 'spec_helper'

describe Fitgem::Client do
  describe "constructor" do
    it "requires client_id" do
      expect {
        opts = { :client_secret => "12345" }
        client = Fitgem::Client.new(opts)
      }.to raise_error(Fitgem::InvalidArgumentError, "Missing required options: client_id")
    end

    it "requires client_secret" do
      expect {
        opts = { :client_id => "12345" }
        client = Fitgem::Client.new(opts)
      }.to raise_error(Fitgem::InvalidArgumentError, "Missing required options: client_secret")
    end
  end
end
