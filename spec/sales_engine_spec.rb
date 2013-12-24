describe SalesEngine do
  let(:engine) { SalesEngine.new }

  describe ".new" do
    it "creates a new SalesEngine instance" do
      expect(engine).to be_an_instance_of SalesEngine
    end
  end

  describe "#merchant_repository" do
    it "returns an instance of MerchantRepository" do
      expect(engine.merchant_repository).to be_an_instance_of MerchantRepository
    end
  end
end
