require 'spec_helper'

describe CustomerRepository do
  subject { CustomerRepository.new }

  before do
    build(:customer, repository: subject)
  end

  it { should be_an_instance_of CustomerRepository }

  describe "#load_csv_data" do
    let(:data) { "id,first_name,last_name,created_at,updated_at\r1,Joey,Ondricka,2012-03-27 14:54:09 UTC,2012-03-27 14:54:09 UTC"}
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
      expect(subject.random).to be_an_instance_of Customer
    end
  end

  describe "#find_by_id" do
    it "returns the Merchant instance with the given id" do
      expect(subject.find_by_id(1)).to eq(subject.all.first)
    end
  end
end
