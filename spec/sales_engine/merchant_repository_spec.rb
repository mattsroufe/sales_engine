require 'spec_helper'

describe MerchantRepository do
  subject { MerchantRepository.instance }

  it { should be_an_instance_of MerchantRepository }

  describe "#all" do
    it "returns all merchants" do
      expect(subject.all.count).to eq(100)
    end
  end

  describe "#find_by_id" do
    it "returns the Merchant instance with the given id" do
      expect(subject.find_by_id(1)).to eq(subject.all.first)
    end
  end
end
