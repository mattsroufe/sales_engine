require 'spec_helper'

describe InvoiceRepository do
  let(:invoice_repository) { InvoiceRepository.new }

  describe ".new" do
    it "creates a new InvoiceRepository" do
      expect(invoice_repository).to be_an_instance_of InvoiceRepository
    end
  end

  describe "#all" do
    it "returns all invoices" do
      expect(invoice_repository.all.count).to eq(4843)
    end
  end

  describe "#find_by_id" do
    it "returns the Invoice instance with the given id" do
      expect(invoice_repository.find_by_id(1)).to eq(invoice_repository.all.first)
    end
  end
end
