require 'spec_helper'

describe MerchantRepository do
  let(:merchant_repository) { MerchantRepository.new }

  describe ".new" do
    it "creates a new MerchantRepository" do
      expect(merchant_repository).to be_an_instance_of MerchantRepository
    end
  end

  describe "#all" do
    it "returns all merchants" do
      expect(merchant_repository.all.count).to eq(100)
    end
  end

  describe "#find_by_id" do
    it "returns the Merchant instance with the given id" do
      expect(merchant_repository.find_by_id('1')).to eq(merchant_repository.all.first)
    end
  end
end