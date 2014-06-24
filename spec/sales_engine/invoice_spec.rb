require 'spec_helper'

describe Invoice do
  let(:invoice) { Invoice.new(id: 1, customer_id: 2, merchant_id: 3, status: 'shipped', created_at: '2012-03-27 14:53:59 UTC', updated_at: Time.parse('2012-03-27 14:53:59 UTC')) }

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
      expect(invoice.customer_id).to eq(2)
    end
  end

  describe "#merchant_id" do
    it "returns the invoice merchant_id" do
      expect(invoice.merchant_id).to eq(3)
    end
  end

  describe "#status" do
    it "returns the invoice status" do
      expect(invoice.status).to eq('shipped')
    end
  end

  describe "#created_at" do
    it "returns the invoice created_at" do
      expect(invoice.created_at).to eq('2012-03-27 14:53:59 UTC')
    end
  end

  describe "#updated_at" do
    it "returns the invoice updated_at" do
      expect(invoice.updated_at).to eq(Time.new(2012,3,28,3,53,59).utc)
    end
  end
end
