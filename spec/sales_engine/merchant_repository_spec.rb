require 'spec_helper'

describe MerchantRepository do
  subject { MerchantRepository.instance }

  before do
    subject.all.clear
    build(:merchant)
  end

  it { should be_an_instance_of MerchantRepository }

  describe "#load_csv_data" do
    let(:data) { "id,name,created_at,updated_at\r1,Schroeder-Jerde,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC"}
    let(:options) { {universal_newline: false, headers: true, header_converters: :symbol, converters: :integer} }

    it "loads data from csv file" do
      allow(File).to receive(:open).with(subject.class::CSV_DATA_FILE, options).and_return(StringIO.new(data))
      expect{subject.load_csv_data}.to change{subject.all.count}.by(1)
    end
  end

  describe "#all" do
    it "returns all merchants" do
      expect(subject.all.count).to eq(1)
    end
  end

  describe "#random" do
    it "returns a random merchant" do
      expect(subject.random).to be_an_instance_of Merchant
    end
  end

  describe "#find_by_id" do
    it "returns the Merchant instance with the given id" do
      expect(subject.find_by_id(1)).to eq(subject.all.first)
    end
  end

  describe "#find_by_name" do
    it "returns the first merchant with the given name (case-insensitive)" do
      expect(subject.find_by_name("Diaminx")).to eq(nil)
      expect(subject.find_by_name("Diaminx Corp").id).to eq(1)
    end
  end
end
