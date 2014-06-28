require 'spec_helper'

describe Item do
  let(:item) { build(:item) }

  describe ".new" do
    it "creates a new Item" do
      expect(item).to be_an_instance_of Item
    end
  end

  describe "#id" do
    it "returns the item id" do
      expect(item.id).to eq(1)
    end
  end

  describe "#name" do
    it "returns the item name" do
      expect(item.name).to eq('Item Qui Esse')
    end
  end

  describe "#description" do
    it "returns the item description" do
      expect(item.description).to eq('Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.')
    end
  end

  describe "#unit_price" do
    it "returns the item unit_price" do
      expect(item.unit_price).to eq(75107)
    end
  end

  describe "#merchant_id" do
    it "returns the item merchant_id" do
      expect(item.merchant_id).to eq(1)
    end
  end

  describe "#created_at" do
    it "returns the item created_at" do
      expect(item.created_at).to eq(Time.new(2014,6,1))
    end
  end

  describe "#updated_at" do
    it "returns the item updated_at" do
      expect(item.updated_at).to eq(Time.new(2014,6,1))
    end
  end
end
