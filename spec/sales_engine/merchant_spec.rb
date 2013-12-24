require 'spec_helper'

describe Merchant do
  let(:merchant) { Merchant.new(1,'Schroeder-Jerde','2012-03-27 14:53:59 UTC','2012-03-27 14:53:59 UTC') }

  describe ".new" do
    it "creates a new Merchant" do
      expect(merchant).to be_an_instance_of Merchant
    end
  end

  describe "#id" do
    it "returns the merchant id" do
      expect(merchant.id).to eq(1)
    end
  end

  describe "#name" do
    it "returns the merchant name" do
      expect(merchant.name).to eq('Schroeder-Jerde')
    end
  end

  describe "#created_at" do
    it "returns the merchant created_at" do
      expect(merchant.created_at).to eq('2012-03-27 14:53:59 UTC')
    end
  end

  describe "#updated_at" do
    it "returns the merchant updated_at" do
      expect(merchant.updated_at).to eq('2012-03-27 14:53:59 UTC')
    end
  end
end
