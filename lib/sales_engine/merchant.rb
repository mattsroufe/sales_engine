class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(args = {})
    repository = args[:repository] || MerchantRepository.new
    @id = args[:id]
    @name = args[:name]
    @sales_engine_id = repository.sales_engine_id
    @created_at = args[:created_at]
    @updated_at = args[:updated_at]
    repository.all << self
  end

  def sales_engine
    ObjectSpace._id2ref(@sales_engine_id)
  end

  def invoices
    sales_engine.invoice_repository.find_all_by_merchant_id(id)
  end

  def items
    sales_engine.item_repository.find_all_by_merchant_id(id)
  end
end
