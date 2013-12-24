require 'spec_helper'

describe Merchant do

  describe ".new" do
    it "creates a new Merchant" do
      expect(Merchant.new).to be_an_instance_of Merchant
    end
  end
end
