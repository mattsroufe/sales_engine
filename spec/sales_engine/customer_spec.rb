require 'spec_helper'

describe Customer do
  let(:customer) { build(:customer) }

  describe ".new" do
    it "creates a new Customer" do
      expect(customer).to be_an_instance_of Customer
    end
  end

  describe "#id" do
    it "returns the customer id" do
      expect(customer.id).to eq(1)
    end
  end

  describe "#first_name" do
    it "returns the customer first_name" do
      expect(customer.first_name).to eq("Joey")
    end
  end

  describe "#last_name" do
    it "returns the customer last_name" do
      expect(customer.last_name).to eq("Ondricka")
    end
  end

  describe "#created_at" do
    it "returns the customer created_at" do
      expect(customer.created_at).to eq(Time.new(2014,6,1))
    end
  end

  describe "#updated_at" do
    it "returns the customer updated_at" do
      expect(customer.updated_at).to eq(Time.new(2014,6,1))
    end
  end
end
