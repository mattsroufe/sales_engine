require 'spec_helper'

describe CustomerRepository do
  let(:sales_engine) { double }
  subject { CustomerRepository.new(sales_engine) }

  it { should be_an_instance_of CustomerRepository }

  describe "#all" do
    it "returns all customers" do
      expect(subject.all.count).to eq(1000)
    end
  end

  describe "#random" do
    it "returns a random merchant" do
      expect(subject.random).to be_an_instance_of Customer
    end
  end

  describe "#find_by_id" do
    it "returns the Merchant instance with the given id" do
      expect(subject.find_by_id(3)).to eq(subject.all[2])
    end
  end
end
