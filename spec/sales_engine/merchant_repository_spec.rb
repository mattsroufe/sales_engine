require 'spec_helper'

describe MerchantRepository do
  subject { MerchantRepository.instance }
  before(:all) { build(:merchant) }

  it { should be_an_instance_of MerchantRepository }

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
