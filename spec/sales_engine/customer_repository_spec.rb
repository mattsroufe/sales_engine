require 'spec_helper'

describe CustomerRepository do

  before(:all) do
    data =
%q{id,first_name,last_name,created_at,updated_at
1,Joey,Ondricka,2012-03-27 14:54:09 UTC,2012-03-27 14:54:09 UTC
2,Cecelia,Osinski,2012-03-27 14:54:10 UTC,2012-03-27 14:54:10 UTC
3,Mariah,Toy,2012-03-27 14:54:10 UTC,2012-03-27 14:54:10 UTC}
    @customer_repository = CustomerRepository.new(nil, data)
  end

  subject { @customer_repository }

  it { should be_an_instance_of CustomerRepository }

  describe "#all" do
    it "returns all customers" do
      expect(subject.all.count).to eq(3)
    end
  end

  describe "#random" do
    it "returns a random merchant" do
      expect(subject.random).to be_an_instance_of Customer
    end
  end

  describe "#find_by_id" do
    it "returns the Merchant instance with the given id" do
      expect(subject.find_by_id(3)).to eq(subject[2])
    end
  end
end
