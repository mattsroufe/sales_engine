require 'spec_helper'

describe ItemRepository do
  subject { ItemRepository.new }

  before do
    build(:item, repository: subject)
    build(:item, repository: subject, merchant_id: 2)
  end

  it { should be_an_instance_of ItemRepository }

  describe "#load_csv_data" do
    let(:data) { "id,name,description,unit_price,merchant_id,created_at,updated_at\r1,Item Qui Esse,Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.,75107,1,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC" }
    let(:options) { {universal_newline: false, headers: true, header_converters: :symbol, converters: :integer} }

    it "loads data from csv file" do
      allow(File).to receive(:open).with(subject.class::CSV_DATA_FILE, options).and_return(StringIO.new(data))
      expect{subject.load_csv_data}.to change{subject.all.count}.by(1)
    end
  end

  describe "#all" do
    it "returns all items" do
      expect(subject.all.count).to eq(2)
    end
  end

  describe "#random" do
    it "returns a random item" do
      expect(subject.random).to be_an_instance_of Item
    end
  end

  describe "#find_by_id" do
    it "returns the Invoice instance with the given id" do
      expect(subject.find_by_id(1)).to eq(subject.all.first)
    end
  end

  describe "#find_all_by_merchant_id" do
    it "returns all items for the given merchant_id" do
      expect(subject.find_all_by_merchant_id(1).count).to eq(1)
    end
  end
end
