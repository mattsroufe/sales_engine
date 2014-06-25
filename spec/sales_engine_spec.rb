describe SalesEngine do
  let(:engine) { SalesEngine.instance }

  describe ".new" do
    it "creates a new SalesEngine instance" do
      expect(engine).to be_an_instance_of SalesEngine
    end

    it "raises an error if a SalesEngine instance already exists" do
      expect( -> { SalesEngine.new } ).to raise_error RuntimeError, 'SalesEngine instance already exists'
    end
  end

  describe "#merchant_repository" do
    it "returns an instance of MerchantRepository" do
      expect(engine.merchant_repository).to be_an_instance_of MerchantRepository
    end
  end

  describe "#invoice_repository" do
    it "returns an instance of InvoiceRepository" do
      expect(engine.invoice_repository).to be_an_instance_of InvoiceRepository
    end
  end
end
