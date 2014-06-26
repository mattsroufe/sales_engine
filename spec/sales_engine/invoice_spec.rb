require 'spec_helper'

describe Invoice do
  let(:invoice) { build(:invoice) }

  describe ".new" do
    it "creates a new Invoice" do
      expect(invoice).to be_an_instance_of Invoice
    end
  end

  describe "#id" do
    it "returns the invoice id" do
      expect(invoice.id).to eq(1)
    end
  end

  describe "#customer_id" do
    it "returns the invoice customer_id" do
      expect(invoice.customer_id).to eq(1)
    end
  end

  describe "#merchant_id" do
    it "returns the invoice merchant_id" do
      expect(invoice.merchant_id).to eq(1)
    end
  end

  describe "#status" do
    it "returns the invoice status" do
      expect(invoice.status).to eq('shipped')
    end
  end

  describe "#created_at" do
    it "returns the invoice created_at" do
      expect(invoice.created_at).to eq(Time.new(2014,6,1))
    end
  end

  describe "#updated_at" do
    it "returns the invoice updated_at" do
      expect(invoice.updated_at).to eq(Time.new(2014,6,1))
    end
  end
end
