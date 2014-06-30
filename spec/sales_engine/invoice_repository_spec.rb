require 'spec_helper'

describe InvoiceRepository do
  let(:engine) { SalesEngine.new }
  subject { engine.invoice_repository }

  before do
    subject.all << build(:invoice)
  end

  it { should be_an_instance_of InvoiceRepository }

  describe "#load_csv_data" do
    let(:data) { "id,customer_id,merchant_id,status,created_at,updated_at\r1,1,26,shipped,2012-03-25 09:54:09 UTC,2012-03-25 09:54:09 UTC" }
    let(:options) { {universal_newline: false, headers: true, header_converters: :symbol, converters: :integer} }

    it "loads data from csv file" do
      allow(File).to receive(:open).with(subject.class::CSV_DATA_FILE, options).and_return(StringIO.new(data))
      expect{subject.load_csv_data}.to change{subject.all.count}.by(1)
    end
  end

  describe "#all" do
    it "returns all invoices" do
      expect(subject.all.count).to eq(1)
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
      expect(subject.find_all_by_merchant_id(1).count).to eq(1)
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
      }.to change { engine.invoice_item_repository.all.count }.by(3)
    end
  end
end
