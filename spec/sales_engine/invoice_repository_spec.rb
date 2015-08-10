require 'spec_helper'

describe InvoiceRepository do
  subject { SalesEngine.new.invoice_repository }

  it { should be_an_instance_of InvoiceRepository }

  describe "#all" do
    it "returns all invoices" do
      expect(subject.all.count).to eq(4843)
    end
  end

  describe "#random" do
    it "returns a random invoice" do
      expect(subject.random).to be_an_instance_of Invoice
    end
  end

  describe "#find_by_id" do
    it "returns the Invoice instance with the given id" do
      expect(subject.find_by_id(1)).to eq(subject.all.first)
    end
  end

  describe "#find_all_by_merchant_id" do
    it "returns all invoices for the given merchant_id" do
      expect(subject.find_all_by_merchant_id(1).count).to eq(59)
    end
  end

  describe "#create" do
    let(:customer) { build(:customer) }
    let(:merchant) { build(:merchant) }
    let(:item1) { build(:item) }
    let(:item2) { build(:item2) }
    let(:item3) { build(:item3) }

    it "creates a new invoice" do
      expect {
        subject.create(customer: customer, merchant: merchant, status: "shipped", items: [item1, item2, item3])
      }.to change { subject.all.count }.by(1)
    end

    it "creates new invoice items" do
      expect {
        subject.create(customer: customer, merchant: merchant, status: "shipped", items: [item1, item2, item3])
      }.to change { subject.invoice_item_repository.all.count }.by(3)
    end
  end
end
