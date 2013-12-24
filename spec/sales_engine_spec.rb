describe SalesEngine do

  describe ".new" do
    it "creates a new SalesEngine instance" do
      expect(SalesEngine.new).to be_an_instance_of SalesEngine
    end
  end
end
