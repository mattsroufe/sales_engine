require 'spec_helper'

describe ItemRepository do
  subject { ItemRepository.new(double) }

  it { should be_an_instance_of ItemRepository }

  describe "#all" do
    it "returns all items" do
      expect(subject.all.count).to eq(3)
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
      expect(subject.find_all_by_merchant_id(1).count).to eq(2)
    end
  end
end
