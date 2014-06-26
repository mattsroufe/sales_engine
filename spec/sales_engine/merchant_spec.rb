require 'spec_helper'

describe Merchant do
  let(:merchant) { build(:merchant) }

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
      expect(merchant.name).to eq("Diaminx Corp")
    end
  end

  describe "#created_at" do
    it "returns the merchant created_at" do
      expect(merchant.created_at).to eq(Time.new(2014,6,1))
    end
  end

  describe "#updated_at" do
    it "returns the merchant updated_at" do
      expect(merchant.updated_at).to eq(Time.new(2014,6,1))
    end
  end

  describe "#invoices" do
    before do
      InvoiceRepository.instance.all.clear
      build(:invoice)
    end

    it "return the invoices associated with the merchant" do
      expect(merchant.invoices.count).to eq(1)
    end
  end
end
